define usvn::install($version = $title, $svnpath)
{
	include usvn::params

	# Config
	File {
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0755,
	}
	Exec {
		path => ['/bin','/usr/bin'],
	}
	# Config

	# Params
	$urlsource   = "${usvn::params::download}/${version}.tar.gz"
	$pkgname     = "usvn-${version}.tar.gz"
	$destination = "${usvn::params::srcdir}/${pkgname}"
	# Params

	# Creating source directory
	if !defined(File[$usvn::params::srcdir]) {
		file {$usvn::params::srcdir:}
	}
	# Creating source directory

	# Creating svn directory
	file {$svnpath:
		owner => 'www-data',
		group => 'www-data',
	}
	# Creating svn directory

	# Downloading the package
	wget::fetch {'wget-usvn':
		source      => $urlsource,
		destination => $destination,
		before      => Exec['tar-usvn'],
	}
	# Downloading the package

	# Unpacking the source
	exec {'tar-usvn':
		command => "tar -xzf ${destination}",
		cwd     => $usvn::params::srcdir,
		onlyif  => [
			"test -f ${destination}",
			"test ! -d ${usvn::params::srcdir}/usvn-${version}",
		],
		before  => Exec['copy-usvn'],
	}
	# Unpacking the source

	# Installing the usvn
	file {$usvn::params::instdir:}
	exec {'copy-usvn':
		command => "cp -Rf ${usvn::params::srcdir}/usvn-${version} ${usvn::params::instdir}/${version}",
		onlyif  => [
			"test -d ${usvn::params::srcdir}/usvn-${version}",
			"test ! -d ${usvn::params::instdir}/${version}",
		],
	}
	exec {'usvn-owner':
		command => "chown -R www-data: ${usvn::params::instdir}/${version}",
		require => Exec['copy-usvn'],
	}
	file {"${usvn::params::instdir}/current":
		ensure => link,
		target => "${usvn::params::instdir}/${version}",
	}
	# Installing the usvn

	# Granting write permissions
	exec {'write-permissions-step-1':
		command => "chmod 777 ${usvn::params::instdir}/current/public",
		require => Exec['copy-usvn'],
		before  => Exec['write-permissions-step-2'],
	}
	exec {'write-permissions-step-2':
		command => "chmod 777 ${usvn::params::instdir}/current/config",
		require => Exec['copy-usvn'],
		before  => File['write-permissions-step-3'],
	}
	file {'write-permissions-step-3':
		ensure  => present,
		path    => "${usvn::params::instdir}/current/config/config.ini",
		content => '[general]',
		mode    => 0777,
	}
	# Granting write permissions
}
