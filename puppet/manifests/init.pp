##
 # Development environment provided by external modules of Puppet Forge.
##
class configure
{
	class {'env':
		link_in_home => ['www=/www'],
		dirs_in_home => ['tmp'],
	}
    class {'vim':
        tabstop  => 4,
        opt_misc => ['number','nowrap'],
    }
	class {'php':
		modules => ['apc','memcache','memcached','mssql','gd','imagick'],
	}
	class {'zf':
		version => 1,
	}
    class {'apache':
        default_mods  => true,
        default_vhost => false,
        mpm_module    => 'prefork',
    }   
    apache::mod {'php5':}
    apache::mod {'rewrite':}
}

##
 # Development environment provided by local modules.
##
class pre_configure
{
    include wwwdirs
}
class post_configure
{
	include prefork
	include vhosts
}

# Executing the Puppet configuration
class {['pre_configure','configure','post_configure']:}
