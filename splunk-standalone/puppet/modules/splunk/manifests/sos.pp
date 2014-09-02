class splunk::sos (){

	splunk::tarball{"$sos_tgz":
		source_path => "file:///vagrant/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$sos_tgz",
	}
	
	file { ["/opt/splunk/etc/apps/sos/","/opt/splunk/etc/apps/sos/local"]:
		ensure  => directory,
	}
	file { "/opt/splunk/etc/apps/sos/local/inputs.conf":
		source => "puppet:///modules/splunk/sos_inputs.conf"
	}
}
