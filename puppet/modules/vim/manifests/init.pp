class vim(
  $ensure   = $vim::params::ensure,
  $encoding = $vim::params::encoding,
  $tabstop  = $vim::params::tabstop,
  $opt_misc = $vim::params::opt_misc,
  $plugins  = $vim::params::plugins,
) inherits vim::params {
	include vim::dependencies
	if $ensure == 'present' {
		exec {"update-alternatives --set editor /usr/bin/vim.basic":
			path    => "/usr/bin:/usr/sbin:/bin",
			unless  => "test /etc/alternatives/editor -ef /usr/bin/vim.basic",
			require => Package[$vim::params::vim],
		}
		file {"$vim::params::vimpath/vimrc.local":
			ensure  => present,
			content => template('vim/vimrc.local.erb'),
			owner   => root,
			group   => root,
			mode    => 0644,
			require => Package[$vim::params::vim],
		}
		vim::plugins::install{$plugins:}
	} else {
		package {$vim::params::vim: ensure => 'absent'}
		file    {["$vim::params::vimpath/vimrc.local", $vim::params::vimpath]: ensure => 'absent'}
	}
}
