include system
include nfsclient
include splunk
include splunk-search-head
include splunk-search-head-pool-node
include splunk-app-for-nix
include splunk-app-sos
include splunk-app-sideview-utils
class {'splunk-outputs':
	type => "splunk"
}