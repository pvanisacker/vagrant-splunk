class splunk::splunk_TA_nix (){
	splunk::tarball{"$splunktanix_tgz":
		source_path => "file:///vagrant/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$splunktanix_tgz",
	}
	file { ["/opt/splunk/etc/apps/Splunk_TA_nix", "/opt/splunk/etc/apps/Splunk_TA_nix/local"]:
		ensure  => directory,
	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local/inputs.conf":
		source => "puppet:///modules/splunk/Splunk_TA_nix/inputs.conf"
	}
	file { "/opt/splunk/etc/apps/Splunk_TA_nix/local/app.conf":
		source => "puppet:///modules/splunk/Splunk_TA_nix/app.conf"
	}
}
