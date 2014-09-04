class splunkforwarder::splunk_ta_nix (){
	common::tarball{"$splunkaddonnix_tgz":
		source_path => "file:///media/apps/",
		install_dir => "/opt/splunkforwarder/etc/apps/",
		pkg_tgz     => "$splunkaddonnix_tgz",
	}

	file { ["/opt/splunkforwarder/etc/apps/Splunk_TA_nix",
			"/opt/splunkforwarder/etc/apps/Splunk_TA_nix/local"]:
		ensure  => directory,
		require => Common::Tarball["$splunkaddonnix_tgz"]
	}

	file { "/opt/splunkforwarder/etc/apps/Splunk_TA_nix/local/inputs.conf":
		source => "puppet:///modules/splunkforwarder/Splunk_TA_nix/inputs.conf",
		require => File["/opt/splunkforwarder/etc/apps/Splunk_TA_nix/local"]
	}
	file { "/opt/splunkforwarder/etc/apps/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunkforwarder/Splunk_TA_nix/app.conf",
		require => File["/opt/splunkforwarder/etc/apps/Splunk_TA_nix/local"]
	}
}
