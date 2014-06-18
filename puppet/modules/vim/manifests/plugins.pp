class vim::plugins 
{
	define install() {
		package {"vim-${name}":
			ensure  => present,
			require => Package[$vim::params::vim],
		}
		exec {"vim-addons install ${name}":
			path    => ['/bin','/usr/bin'],
			require => Package["vim-${name}"],
			onlyif  => "test `find /root/.vim | grep -i ${name} | wc -l` -eq 0"
		}
	}
}
