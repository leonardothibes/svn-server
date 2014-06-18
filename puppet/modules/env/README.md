puppet-env
==========

A puppet module to provide a Redhat shell style for Debian/Ubuntu/Mint.

## Sample Usage
Install env and use the provided configuration defaults:
```puppet
node default {
	class {'env':}
}
```
or
```puppet
node default {
	include env
}
```

Install env with prompt to cp/mv/rm commands:
```puppet
class {'env':
    cp_prompt => true,
    mv_prompt => true,
    rm_prompt => true,
}
```

Clearing screen on logout:
```puppet
class {'env':
    clear_on_logout => true,
}
```

Installing utils and creating directories in user's homes:
```puppet
class {'env':
    dirs_in_home => ['tmp','workspace'],
    utils        => ['subversion','git'],
}
```

Creating links in user's homes:
```puppet
class {'env':
    link_in_home => ['workspace=/vagrant','www=/srv/www'],
}
```

Creating aliases to some commands:
```puppet
class {'env':
    aliases => ["phing=clear ; phing","phpunit=clear ; phpunit"],
}
```

Contact
-------

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-env/issues)
