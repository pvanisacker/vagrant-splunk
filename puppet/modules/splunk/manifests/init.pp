class splunk {
	# Make sure the needed dirs exist
	file { ["/opt/splunk", "/opt/splunk/etc","/opt/splunk/etc/apps"]:
		ensure  => directory,
	}

	# Install splunk
	package { "splunk":
		source => "file:///media/rpms/$splunk_rpm",
		ensure => installed,
		provider => "rpm";
	}
	# Install the splunk init script and accept the license
	exec { "/etc/init.d/splunk" :
		command => "/opt/splunk/bin/splunk enable boot-start --accept-license --no-prompt --answer-yes",
		subscribe => Package["splunk"];
	}

	# Make sure the first time login message does not show up
	file { "/opt/splunk/etc/.ui_login":
		ensure => "file",
		require => Package[ "splunk" ]
	}

	# Start the service
	service { "splunk":
		ensure => "running",
		enable => true,
		require => Exec[ "/etc/init.d/splunk" ],
	}

	# Set the admin passoword to admin
	exec { "splunkpasswordchange":
		command => "/opt/splunk/bin/splunk edit user admin -password admin -role admin -auth admin:changeme || exit 0",
		require => Service["splunk"]
	}

	# Ensure directory exists
	file { "/opt/splunk/etc/system/local":
		ensure  => directory,
	}
	# Copy the custom web.conf
	file { "/opt/splunk/etc/system/local/web.conf":
		source => "puppet:///modules/splunk/web.conf",
		require => File["/opt/splunk/etc/system/local"],
		notify  => Service["splunk"]
	}

	# Install Splunk On Splunk
	class { "splunk::sos":
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
	# Install Sideview Utils
	class { "splunk::sideview_utils":
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
	# Install Splunk on Unix and Linux
	class { "splunk::splunk_app_for_nix":
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
}
