class usvn::params
{
	$ensure = 'present'

	# USVN
	$version  = '1.0.7'
	$download = 'https://github.com/usvn/usvn/archive'
	$srcdir   = '/usr/src'
	$svnpath  = '/var/lib/usvn'
	$instdir  = '/usr/share/usvn'
	# USVN

	# APACHE
	$vhost_url      = 'svn.local'
	$vhost_baseurl  = '/svn'
	$vhost_port     = '80'
	$vhost_priority = '99'
	# APACHE

	# MYSQL
	$dbuser = 'usvn'
	$dbpass = 'usvn'
	$dbname = 'usvn'
	# MYSQL
}
