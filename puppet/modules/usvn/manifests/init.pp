class usvn(
	$ensure   = $usvn::params::ensure,
	$version  = $usvn::params::version,
	$svnpath  = $usvn::params::svnpath,
	$url      = $usvn::params::vhost_url,
	$baseurl  = $usvn::params::vhost_baseurl,
	$port     = $usvn::params::vhost_port,
	$priority = $usvn::params::vhost_priority,
	$dbname   = $usvn::params::dbname,
	$dbuser   = $usvn::params::dbuser,
	$dbpass   = $usvn::params::dbpass,
) inherits usvn::params {

	include usvn::dependencies
	case $ensure {
		'present': {
			usvn::install {$version:
				svnpath => $svnpath,
			} -> usvn::apache::configure {$url:
				baseurl  => $baseurl,
				port     => $port,
				priority => $priority,
				svnpath  => $svnpath,
			} -> usvn::mysql::configure {$dbname:
				dbuser => $dbuser,
				dbpass => $dbpass,
			}
		}
		'absent': {
			usvn::apache::remove {'remove::usvn::vhosts':}
			usvn::uninstall {'uninstalling::usvn':}
		}
		default : { fail("Unsupported option for \"ensure\" param: ${ensure}") }
	}
}
