puppet-vim
=============

Manage Vim via Puppet.

## Sample Usage
Install VIM and use the provided configuration defaults
```puppet
node default {
	class {'vim':}
}
```
or
```puppet
node default {
	include vim
}
```

With params
```puppet
node default {
	class {'vim':
		tabstop  => 4,
		encoding => 'utf-8',
	}
}
```

With params and plugins
```puppet
node default {
	class {'vim':
		tabstop => 4,
		plugins => ['puppet','rails'],
	}
}
```

With other params
```puppet
node default {
	class {'vim':
		tabstop  => 4,
		opt_misc => ['nonumber','wrap'],
	}
}
```

Uninstall vim
```puppet
node default {
	class {'vim':
		ensure => absent,
	}
}
```

Contact
-------

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-vim/issues)
