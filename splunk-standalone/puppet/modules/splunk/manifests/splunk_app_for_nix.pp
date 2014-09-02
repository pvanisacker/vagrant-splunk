class splunk::splunk_app_for_nix (){
	splunk::tarball{"$splunkonunix_tgz":
		source_path => "file:///vagrant/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$splunkonunix_tgz",
	}
	
	file { ["/opt/splunk/etc/apps/splunk_app_for_nix", "/opt/splunk/etc/apps/splunk_app_for_nix/local"]:
		ensure  => directory,
	}
	file { "/opt/splunk/etc/apps/splunk_app_for_nix/local/app.conf":
		source => "puppet:///modules/splunk/splunk_app_for_nix/app.conf"
	}
}
