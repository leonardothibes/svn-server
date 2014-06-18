class vim::params
{
	$ensure   = 'present'
	$encoding = 'utf-8'
	$tabstop  = '4'
	$vim      = "vim"
	$vimpath  = "/etc/vim"
	$opt_misc = ['nobackup','number']
	$plugins  = []
}
