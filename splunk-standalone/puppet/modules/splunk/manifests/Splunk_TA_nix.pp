class splunk::Splunk_TA_nix (){
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
