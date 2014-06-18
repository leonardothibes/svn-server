class env::aliases
{
	define prompt(
		$cp = false,
		$mv = false,
		$rm = false,
	) {
		if $cp { create {'cp': command => 'cp -i'} } else { destroy {'cp':} }
		if $mv { create {'mv': command => 'mv -i'} } else { destroy {'mv':} }
		if $rm { create {'rm': command => 'rm -i'} } else { destroy {'rm':} }
	}

	define ls_colors($flag = $title)
	{
		if $flag {
			create {'ls': command => 'ls -h --color'}
		} else {
			destroy {'ls':}
		}
	}

	define array($array = $title)
	{
		$items = split($array, '=')
		if $items[1] == '' or $items[1] == 'false' {
			destroy {$items[0]:}
		} else {
			create {$items[0]: command => $items[1]}
		}
	}

	define create(
		$file    = $title,
		$command = '',
	) {
		file {"${env::params::aliases_path}/${file}.sh":
			ensure  => present,
			owner   => root,
			group   => root,
			mode    => 0644,
			content => "alias ${file}='${command}'",
		}
	}

	define destroy($file = $title)
	{
		file {"${env::params::aliases_path}/$file.sh": ensure => absent}
	}
}
