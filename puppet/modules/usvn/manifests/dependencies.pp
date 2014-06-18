class usvn::dependencies
{
    if $osfamily != 'Debian' {
        fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }   
    require wget
    if !defined(Packages['php5'])         { package {'php5'        : ensure  => present} }
    if !defined(Packages['php5-mysqlnd']) { package {'php5-mysqlnd': ensure  => present} }
    if !defined(Packages['subversion'])   { package {'subversion'  : ensure  => present} }
}
