class vim::dependencies
{
	if $osfamily != 'Debian' {
		fail("Unsupported platform: ${osfamily}/${operatingsystem}")
	}
	$resource = 'vim::dependencies::packages'
	if !defined(Package[$resource]) {
		package {$resource:
			ensure => present,
			name   => $vim::params::vim,
		}
	}
}
