# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test in a virtual environment
# (to compare the resulting system state to the desired state).
#
# Learn more about module testing here: http://docs.puppetlabs.com/guides/tests_smoke.html
#
class {'env':
	cp_prompt       => true,
	mv_prompt       => true,
	rm_prompt       => true,
	clear_on_logout => true,
	home_chmod      => 700,
	dirs_in_home    => ['tmp'],
	link_in_home    => ['workspace=/vagrant'],
	utils           => ['git','nmap'],
	aliases         => ["phing=clear ; phing","phpunit=clear ; phpunit"],
}
