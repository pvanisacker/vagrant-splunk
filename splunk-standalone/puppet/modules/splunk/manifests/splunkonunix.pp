class splunk::splunkonunix (){
	splunk::tarball{"$splunkonunix_tgz":
		source_path => "file:///vagrant/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$splunkonunix_tgz",
	}
	
	file { ["/opt/splunk/etc/apps/splunk_app_for_nix", "/opt/splunk/etc/apps/splunk_app_for_nix/local"]:
		ensure  => directory,
	}
	file { "/opt/splunk/etc/apps/splunk_app_for_nix/local/inputs.conf":
		source => "puppet:///modules/splunk/splunkonunix_inputs.conf"
	}
}
