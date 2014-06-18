class env::utils
{
	define install($packages = $title)
	{
		if !defined(Package[$packages]) {
			package {$packages: ensure => latest}
		}
	}

	define uninstall($packages = $title)
	{
		package {$packages: ensure => absent}
	}
}
