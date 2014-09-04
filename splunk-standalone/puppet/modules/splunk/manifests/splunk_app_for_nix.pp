class splunk::splunk_app_for_nix (){
	splunk::tarball{"$splunkonnix_tgz":
		source_path => "file:///vagrant/apps/",
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
		require => Splunk::Tarball["$splunkonnix_tgz"]
	}

	
	file { "/opt/splunk/etc/apps/Splunk_TA_nix":
		ensure => "directory",
		owner => "root",
		group => "root",
		recurse => true,
		source => "file:///opt/splunk/etc/apps/splunk_app_for_nix/install/Splunk_TA_nix",
		require => Splunk::Tarball["$splunkonnix_tgz"]
	}
}
