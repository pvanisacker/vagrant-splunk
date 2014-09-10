include system
include splunk
include splunk-master
include splunk-app-sos
include splunk-app-sideview-utils
class {'splunk-app-addon-for-nix': 
	splunk_home=>"/opt/splunk",
	require => Package["splunk"],
	notify  => Service["splunk"]
}