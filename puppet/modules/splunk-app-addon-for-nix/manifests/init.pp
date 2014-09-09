class splunk-app-addon-for-nix($splunk_home="/opt/splunk") {
	common::tarball{"$splunkaddonnix_tgz":
		source_path => "file:///media/apps/",
		install_dir => "${splunk_home}/etc/apps/",
		pkg_tgz     => "$splunkaddonnix_tgz",
	}

	file { ["${splunk_home}/etc/apps/Splunk_TA_nix",
			"${splunk_home}/etc/apps/Splunk_TA_nix/local"]:
		ensure  => directory,
		require => Common::Tarball["$splunkaddonnix_tgz"]
	}

	file { "${splunk_home}/etc/apps/Splunk_TA_nix/local/inputs.conf":
		source => "puppet:///modules/splunk-app-addon-for-nix/inputs.conf",
		require => File["${splunk_home}/etc/apps/Splunk_TA_nix/local"]
	}
	file { "${splunk_home}/etc/apps/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunk-app-addon-for-nix/app.conf",
		require => File["${splunk_home}/etc/apps/Splunk_TA_nix/local"]
	}
}
