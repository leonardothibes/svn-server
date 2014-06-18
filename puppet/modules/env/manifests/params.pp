class env::params
{
	$cp_prompt       = true
	$mv_prompt       = true
	$rm_prompt       = true
	$ls_colors       = true
	$bash_completion = true
	$clear_on_logout = true
	$ps1             = '[\u@\h \W]'
	$dirs_in_home    = ['tmp']
	$link_in_home    = []
	$utils           = []
	$aliases         = []
	$aliases_path    = '/etc/profile.d'
	$skel_path       = '/etc/skel'
    $home_chmod      = 755
	$root_path       = '/root'
	$root_chmod      = 700
}
