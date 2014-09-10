include system
include splunkforwarder
class {'splunk-app-addon-for-nix': 
	install_dir=>"/opt/splunkforwarder/etc/apps/",
	require => Package["splunkforwarder"],
	notify  => Service["splunkforwarder"]
}
class {'splunk-outputs':
	type => "splunkforwarder"
}
include httpd
include loadgen
