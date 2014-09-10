include system
include splunkforwarder
class {'splunk-app-addon-for-nix': 
	splunk_home=>"/opt/splunkforwarder",
	require => Package["splunkforwarder"],
	notify  => Service["splunkforwarder"]
}
class {'splunk-outputs':
	type => "splunk"
}
include httpd
include loadgen
