class splunkforwarder {
	# Make sure the needed dirs exist
	file { ["/opt/splunkforwarder",
			"/opt/splunkforwarder/etc",
			"/opt/splunkforwarder/etc/apps",
			"/opt/splunkforwarder/etc/system",
			"/opt/splunkforwarder/etc/system/local"]:
		ensure  => directory,
	}

	# Install splunk
	package { "splunkforwarder":
		source => "file:///media/rpms/$forwarder_rpm",
		ensure => installed,
		provider => "rpm";
	}
	# Install the splunk init script and accept the license
	exec { "/etc/init.d/splunk" :
		command => "/opt/splunkforwarder/bin/splunk enable boot-start --accept-license --no-prompt --answer-yes",
		subscribe => Package["splunkforwarder"];
	}

	# Start the service
	service { 'splunkforwarder':
		name => "splunk",
		ensure => 'running',
		enable => true,
		require => Exec[ '/etc/init.d/splunk' ],
	}

	# Set the admin passoword to admin
	exec { "splunkforwarderpasswordchange":
		command => "/opt/splunkforwarder/bin/splunk edit user admin -password admin -role admin -auth admin:changeme || exit 0",
		require => Service["splunkforwarder"]
	}

	# Install Splunk on Unix and Linux
	class { "splunkforwarder::splunk_ta_nix":
		notify  => Service["splunkforwarder"],
		require => Package["splunkforwarder"]
	}
}
