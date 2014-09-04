class splunk::splunk_app_for_nix (){
	common::tarball{"$splunkonnix_tgz":
		source_path => "file:///media/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$splunkonnix_tgz",
	}

	file { ["/opt/splunk/etc/apps/splunk_app_for_nix", "/opt/splunk/etc/apps/splunk_app_for_nix/local"]:
		ensure  => directory,
	}
	file { "/opt/splunk/etc/apps/splunk_app_for_nix/local/app.conf":
		source => "puppet:///modules/splunk/splunk_app_for_nix/app.conf"
	}
	file { "/opt/splunk/etc/apps/SA-nix":
		ensure => "directory",
		owner => "root",
		group => "root",
		recurse => true,
		source => "file:///opt/splunk/etc/apps/splunk_app_for_nix/install/SA-nix",
		require => Common::Tarball["$splunkonnix_tgz"]
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
		source => "puppet:///modules/splunk/Splunk_TA_nix/inputs.conf",
		require => File["/opt/splunk/etc/apps/Splunk_TA_nix/local"]
	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunk/Splunk_TA_nix/app.conf",
		require => File["/opt/splunk/etc/apps/Splunk_TA_nix/local"]
	}
}
