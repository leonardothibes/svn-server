class env::skel
{
	define link($link = $title)
	{
		$items    = split($link, '=')
		$linkname = $items[0]
		$target   = $items[1]
		$links    = [
			"${env::params::skel_path}/${linkname}",
			"${env::params::root_path}/${linkname}",
		]
		
		if $items[1] == '' or $items[1] == 'false' {
			file {[$links,"/home/vagrant/${linkname}"]: ensure => absent}
		} else {
			file {$links:
				ensure => link,
				target => $target,
			}
			exec {"skel::link::vagrant::${linkname}":
				command => "ln -sf ${target} /home/vagrant/${linkname}",
				path    => ['/bin','/usr/bin'],
				onlyif  => [
					"test ! -L /home/vagrant/${linkname}",
					'test -d /home/vagrant',
				],
			}
		}
	}

	define mkdir($dir = $title)
	{
		$dirs = [
			"${env::params::skel_path}/${dir}",
			"${env::params::root_path}/${dir}",
		]
		file {$dirs:
			ensure => directory,
			owner  => root,
			group  => root,
			mode   => 0755,
		}
	}

	define chmod($root, $skel)
	{
		exec {[
			"chmod $root ${env::params::root_path}",
			"chmod $skel ${env::params::skel_path}",
			"chmod $skel /home/*",
		]: path => '/bin'}
	}

	define clear($flag = $title)
	{
		$files = [
			"${env::params::skel_path}/.bash_logout",
			"${env::params::root_path}/.bash_logout",
		]
		if $flag {
			file {$files:
				ensure  => present,
				owner   => root,
				group   => root,
				mode    => 0644,
				content => 'clear'
			}
		} else {
			file {$files: ensure => absent}
		}
	}
}
