class backup
{
	File {
		owner => root,
		group => root,
		mode  => 0755,
	}

	file {'/home/root':
		ensure => link,
		target => '/root',
	}

	$bkpdir = '/var/lib/backup-scripts'
	file {'backup::directory':
		ensure => directory,
		path   => $bkpdir,
	}

	file {'backup::script':
		ensure => present,
		path   => "${bkpdir}/bkp-svn.sh",
	}
}
