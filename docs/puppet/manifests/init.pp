##
 # Development environment provided by external modules of Puppet Forge.
##
class external
{
	class {'env':
		utils        => ['git','make','nmap'],
		link_in_home => ['workspace=/vagrant'],
	}
	class {'vim':
		tabstop  => 4,
		plugins  => ['puppet'],
		opt_misc => ['number','nowrap'],
	}
}

##
 # Development environment provided by local modules.
##
class local
{
	include ssh
}

class {'external':}
class {'local':}
