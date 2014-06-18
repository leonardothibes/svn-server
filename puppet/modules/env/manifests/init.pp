class env(
  $cp_prompt       = $env::params::cp_prompt,
  $mv_prompt       = $env::params::mv_prompt,
  $rm_prompt       = $env::params::rm_prompt,
  $ls_colors       = $env::params::ls_colors,
  $ps1             = $env::params::ps1,
  $bash_completion = $env::params::bash_completion,
  $clear_on_logout = $env::params::clear_on_logout,
  $root_chmod      = $env::params::root_chmod,
  $home_chmod      = $env::params::home_chmod,
  $dirs_in_home    = $env::params::dirs_in_home,
  $link_in_home    = $env::params::link_in_home,
  $aliases         = $env::params::aliases,
  $utils           = $env::params::utils,
) inherits env::params {

	# Creating aliases
	env::aliases::prompt {
		'aliases-prompts':
		cp => $cp_prompt,
		mv => $mv_prompt,
		rm => $rm_prompt,
	}
	env::aliases::array     {$aliases:}
	env::aliases::ls_colors {$ls_colors:}
	# Creating aliases

	# Configuring skeleton dirs
	env::skel::link  {$link_in_home:}
	env::skel::mkdir {$dirs_in_home:}
	env::skel::clear {$clear_on_logout:}
	env::skel::chmod {'chmod':
		skel => $home_chmod,
		root => $root_chmod,
	}
	# Configuring skeleton dirs

	# Configuring PS1 variable
	env::ps1::config {$ps1:}

	# Installing utils
	env::utils::install {$utils:}
}
