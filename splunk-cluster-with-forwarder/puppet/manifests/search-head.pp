include system
include splunk
include splunk-search-head
include splunk-app-for-nix
include splunk-app-sos
include splunk-app-sideview-utils
class {'splunk-outputs':
	type => "splunk"
}