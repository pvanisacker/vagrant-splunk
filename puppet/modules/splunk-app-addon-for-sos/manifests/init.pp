class splunk-app-addon-for-sos($install_dir="/opt/splunk/etc/apps/") {
	common::tarball{"$splunkaddonsos_tgz":
		source_path => "file:///media/apps/",
		install_dir => "${install_dir}",
		pkg_tgz     => "$splunkaddonsos_tgz",
	}

	file { ["${install_dir}/TA-sos",
			"${install_dir}/TA-sos/local"]:
		ensure  => directory,
		require => Common::Tarball["$splunkaddonsos_tgz"]
	}

	file { "${install_dir}/TA-sos/local/app.conf":
		source => "puppet:///modules/splunk-app-addon-for-sos/app.conf",
		require => File["${install_dir}/TA-sos/local"]
	}

	file { "${install_dir}/TA-sos/local/inputs.conf":
		source => "puppet:///modules/splunk-app-addon-for-sos/inputs.conf",
		require => File["${install_dir}/TA-sos/local"]
	}
}
