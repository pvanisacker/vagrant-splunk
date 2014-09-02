class splunk {

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
		source => "puppet:///modules/splunk/web.conf"
	}
	
	class { "splunk::sos": }
	class { "splunk::sideview_utils": }
	class { "splunk::splunkonunix": }
}
