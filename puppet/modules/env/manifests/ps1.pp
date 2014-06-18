class env::ps1
{
	define config($val = $title)
	{
		file {'/etc/profile.d/ps1.sh':
			ensure  => present,
			owner   => root,
			group   => root,
			mode    => 0644,
			content => template('env/ps1.sh.erb'),
		}
		removeBashRc {'bashrc':}
	}

	define removeBashRc()
	{
		$bashrc = [
			'/home/vagrant/.bashrc',
			'/etc/skel/.bashrc',
			'/root/.bashrc',
		]
		file {$bashrc: ensure => absent}
	}
}
