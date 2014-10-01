include system
include splunkforwarder
class {'splunk-outputs':
	type => "splunkforwarder"
}
include splunk-deployment-client
include httpd
include loadgen
