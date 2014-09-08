class splunk-app-for-nix {
	common::tarball{"$splunkonnix_tgz":
		source_path => "file:///media/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$splunkonnix_tgz",
		notify  => Service["splunk"],
		require => Package["splunk"]
	}

	file { ["/opt/splunk/etc/apps/splunk_app_for_nix", "/opt/splunk/etc/apps/splunk_app_for_nix/local"]:
		ensure  => directory,
		require => Common::Tarball["$splunkonnix_tgz"],
	}
	file { "/opt/splunk/etc/apps/splunk_app_for_nix/local/app.conf":
		source => "puppet:///modules/splunk-app-for-nix/app.conf",
		require => Common::Tarball["$splunkonnix_tgz"],
	}
	file { "/opt/splunk/etc/apps/SA-nix":
		ensure => "directory",
		owner => "root",
		group => "root",
		recurse => true,
		source => "file:///opt/splunk/etc/apps/splunk_app_for_nix/install/SA-nix",
		require => Common::Tarball["$splunkonnix_tgz"],
		notify  => Service["splunk"],
	}

	file { "/opt/splunk/etc/apps/Splunk_TA_nix":
		ensure => "directory",
		owner => "root",
		group => "root",
		recurse => true,
		source => "file:///opt/splunk/etc/apps/splunk_app_for_nix/install/Splunk_TA_nix",
		require => Common::Tarball["$splunkonnix_tgz"]
	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local":
		ensure  => directory,
		require => File["/opt/splunk/etc/apps/Splunk_TA_nix"]
	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local/inputs.conf":
		source => "puppet:///modules/splunk-app-for-nix/Splunk_TA_nix/inputs.conf",
		require => File["/opt/splunk/etc/apps/Splunk_TA_nix/local"],
		notify  => Service["splunk"],

	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunk-app-for-nix/Splunk_TA_nix/app.conf",
		require => File["/opt/splunk/etc/apps/Splunk_TA_nix/local"],
		notify  => Service["splunk"],
	}
}