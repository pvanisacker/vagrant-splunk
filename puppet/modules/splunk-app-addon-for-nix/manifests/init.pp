class splunk-app-addon-for-nix($install_dir="/opt/splunk/etc/apps") {
	common::tarball{"$splunkaddonnix_tgz":
		source_path => "file:///media/apps/",
		install_dir => "${install_dir}",
		pkg_tgz     => "$splunkaddonnix_tgz",
	}

	file { ["${install_dir}/Splunk_TA_nix",
			"${install_dir}/Splunk_TA_nix/local"]:
		ensure  => directory,
		require => Common::Tarball["$splunkaddonnix_tgz"]
	}

	file { "${install_dir}/Splunk_TA_nix/local/inputs.conf":
		source => "puppet:///modules/splunk-app-addon-for-nix/inputs.conf",
		require => File["${install_dir}/Splunk_TA_nix/local"]
	}
	file { "${install_dir}/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunk-app-addon-for-nix/app.conf",
		require => File["${install_dir}/Splunk_TA_nix/local"]
	}
}
