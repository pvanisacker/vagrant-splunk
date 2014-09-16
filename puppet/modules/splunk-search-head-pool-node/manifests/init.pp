class splunk-search-head-pool-node {
	exec { "splunk-search-head-pool-node-stop":
		command => "/opt/splunk/bin/splunk stop",
		require => Exec["enable-search-head-splunk-restart"]
	}
	file { "/nfsshare/etc":
		ensure => "directory",
		require => Mount["/nfsshare"]
	}
	file { "/nfsshare/etc/apps":
		recurse => true,
		source => "/opt/splunk/etc/apps",
		require => [Exec["enable-search-head-splunk-restart"],File["/nfsshare/etc"]]
	}
	file { "/nfsshare/etc/users":
		recurse => true,
		source => "/opt/splunk/etc/users",
		require => [Exec["enable-search-head-splunk-restart"],File["/nfsshare/etc"]]
	}
	exec { "splunk-search-head-pool-node-enable":
		command => "/opt/splunk/bin/splunk pooling enable /nfsshare || exit 0",
		require => [Exec["splunk-search-head-pool-node-stop"],File["/nfsshare/etc/apps"],File["/nfsshare/etc/users"]]
	}
	exec { "splunk-search-head-pool-node-start":
		command => "/opt/splunk/bin/splunk start",
		require => [Exec["splunk-search-head-pool-node-enable"],File["/nfsshare/etc/apps"],File["/nfsshare/etc/users"]]
	}
}