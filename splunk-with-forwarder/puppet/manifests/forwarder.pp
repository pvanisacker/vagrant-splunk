include system
include splunkforwarder
class {'splunk-app-addon-for-nix': 
	splunk_home=>"/opt/splunkforwarder",
	require => Package["splunkforwarder"],
	notify  => Service["splunkforwarder"]
}
include splunk-outputs
include httpd
include loadgen
