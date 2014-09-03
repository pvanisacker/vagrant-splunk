class splunk {
	file { ["/opt/splunk", "/opt/splunk/etc","/opt/splunk/etc/apps"]:
		ensure  => directory,
	}
	package { "splunk":
		source => "file:///vagrant/rpm/$splunk_rpm",
		ensure => installed,
		provider => "rpm";
	}
	exec { "/etc/init.d/splunk" :
		command => "/opt/splunk/bin/splunk enable boot-start --accept-license --no-prompt --answer-yes",
		subscribe => Package['splunk'];
	}
	file { '/opt/splunk/etc/passwd':
		owner => 'root', group => 'root', mode => '0600',
		source => 'puppet:///modules/splunk/passwd',
		require => Package[ 'splunk' ],
		notify  => Service["splunk"]
	}
	service { 'splunk':
		ensure => 'running',
		enable => true,
		require => Exec[ '/etc/init.d/splunk' ],
	}
	
	file { "/opt/splunk/etc/system/local":
		ensure  => directory,
	}
	file { "/opt/splunk/etc/system/local/web.conf":
		source => "puppet:///modules/splunk/web.conf",
		require => File["/opt/splunk/etc/system/local"],
		notify  => Service["splunk"]
	}
	
	class { "splunk::sos":
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
	class { "splunk::sideview_utils":
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
	class { "splunk::splunk_app_for_nix": 
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
	class { "splunk::splunk_TA_nix": 
		notify  => Service["splunk"],
		require => Package["splunk"]
	}
}
