include system
include splunk
class {'splunk-outputs':
	type => "splunk"
}
include splunk-deployment-server
class {'splunk-app-addon-for-nix': 
	install_dir=>"/opt/splunk/etc/deployment-apps/",
	require => Package["splunk"],
	notify  => Service["splunk"]
}