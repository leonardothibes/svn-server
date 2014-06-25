##
 # Development environment provided by external modules of Puppet Forge.
##
class external
{
	class {'env':
		link_in_home => ['svn=/var/lib/usvn'],
		dirs_in_home => ['tmp'],
	}
    class {'vim':
        tabstop  => 4,
        opt_misc => ['number','nowrap'],
    }
	class {'usvn':
		dbname  => 'usvn',
		dbuser  => 'usvn',
		dbpass  => 'usvn',
		baseurl => '/repos',
	}
}

##
 # Development environment provided by local modules.
##
class local
{
	include backup
	class {'s3cmd':	user => 'root'}
}

# Executing the Puppet configuration
class {['external','local']:}
