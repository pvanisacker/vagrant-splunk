class splunk-app-sos (){

	common::tarball{"$sos_tgz":
		source_path => "file:///media/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$sos_tgz",
		notify  => Service["splunk"],
		require => Package["splunk"]
	}

	file { ["/opt/splunk/etc/apps/sos/","/opt/splunk/etc/apps/sos/local"]:
		ensure  => directory,
		require => Common::Tarball["$sos_tgz"],
	}
	file { "/opt/splunk/etc/apps/sos/local/inputs.conf":
		source => "puppet:///modules/splunk-app-sos/inputs.conf",
		require => Common::Tarball["$sos_tgz"],
		notify => Service["splunk"]
	}
}
