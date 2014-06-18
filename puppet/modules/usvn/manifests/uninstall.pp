define usvn::uninstall()
{
	include usvn::params
	exec {'usvn::remove::install':
		path    => ['/bin','/usr/bin'],
		command => "rm -Rf ${usvn::params::instdir}",
		onlyif  => "test -d ${usvn::params::instdir}",
	}
}
