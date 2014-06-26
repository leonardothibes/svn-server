class backup
{
	$svndir = '/var/lib/usvn/svn'
	$bkpdir = '/var/lib/backups'
	$bkplog = '/var/log/backups'
	$bucket = 'telesena-svn-backups'

	File {
		owner => root,
		group => root,
		mode  => 0755,
	}

	file {'/home/root':
		ensure => link,
		target => '/root',
	}

	file {'backup::directory':
		ensure => directory,
		path   => $bkpdir,
	}

	file {'backup::script':
		ensure  => present,
		path    => "${bkpdir}/bkp-svn.sh",
		content => template('backup/bkp-svn.sh.erb'),
	}

	file {'backup::log':
		ensure => directory,
		path   => $bkplog,
	}

	crontab::daily {'bkp-svn':
		hour    => 12,
		minute  => 00,
		stdout  => "$bkplog/svn.log",
		stderr  => "$bkplog/svn.log",
		command => "${bkpdir}/bkp-svn.sh",
	}
}
