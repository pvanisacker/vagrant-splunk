class splunk-master-app-addon-for-nix {
	file { "/opt/splunk/etc/master-apps/Splunk_TA_nix/local/indexes.conf":
		ensure => "file",
		source => "puppet:///modules/splunk-master-app-addon-for-nix/Splunk_TA_nix/local/indexes.conf",
		notify  => Service["splunk"],
		require => File["/opt/splunk/etc/master-apps/Splunk_TA_nix/local/"]
	}
}
