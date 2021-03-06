include system
include nfsserver
include splunk
class { "splunk-master":
	rep_factor=>2,
	search_factor=>2,
}
include splunk-app-sos
include splunk-app-sideview-utils
include splunk-master-app-addon-for-nix
include splunk-master-app-addon-for-sos
class {"splunk-outputs":
	type => "splunk"
}
class {"splunk-app-addon-for-nix": 
	install_dir=>"/opt/splunk/etc/master-apps",
	require => Package["splunk"],
	notify  => Service["splunk"]
}
file {"/opt/splunk/etc/apps/Splunk_TA_nix": 
	source => "/opt/splunk/etc/master-apps/Splunk_TA_nix",
	recurse => true,
	require => [Package["splunk"],Class["splunk-app-addon-for-nix"]],
	notify  => Service["splunk"]
}
class {"splunk-app-addon-for-sos": 
	install_dir=>"/opt/splunk/etc/master-apps",
	require => Package["splunk"],
	notify  => Service["splunk"]
}
