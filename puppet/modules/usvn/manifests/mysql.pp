class usvn::mysql
{
	define configure($dbname = $title, $dbuser, $dbpass)
	{
		if !defined(Class['::mysql::server']) {
			include ::mysql::server
		}
		mysql::db {$dbname:
			user     => $dbuser,
			password => $dbpass,
			host     => 'localhost',
			grant    => 'all',
		}
	}
}
