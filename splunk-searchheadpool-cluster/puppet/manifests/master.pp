include system
include nfsserver
include splunk
include splunk-master
include splunk-app-sos
include splunk-app-sideview-utils
include splunk-master-app-addon-for-nix
include splunk-master-app-addon-for-sos
class {'splunk-outputs':
	type => "splunk"
}
class {'splunk-app-addon-for-nix': 
	install_dir=>"/opt/splunk/etc/master-apps",
	require => Package["splunk"],
	notify  => Service["splunk"]
}
class {'splunk-app-addon-for-sos': 
	install_dir=>"/opt/splunk/etc/master-apps",
	require => Package["splunk"],
	notify  => Service["splunk"]
}
