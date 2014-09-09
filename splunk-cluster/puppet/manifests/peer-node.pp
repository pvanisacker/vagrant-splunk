include system
include splunk
include splunk-peer-node
class {'splunk-app-addon-for-nix': 
	splunk_home=>"/opt/splunk"
	require => Package["splunkforwarder"],
	notify  => Service["splunkforwarder"]
}
