class splunk-master-app-addon-for-sos {
	file { "/opt/splunk/etc/master-apps/TA-sos/local/indexes.conf":
		ensure => "directory",
		owner => "root",
		group => "root",
		recurse => true,
		source => "puppet:///modules/splunk-master-app-addon-for-sos/TA-sos/local/indexes.conf",
		notify  => Service["splunk"],
		require => File["/opt/splunk/etc/master-apps/TA-sos/local"]
	}
}
