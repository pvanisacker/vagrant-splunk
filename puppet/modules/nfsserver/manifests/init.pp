class nfsserver {
	file { "/etc/exports":
		content => "/nfsshare 192.168.50.0/8(rw,sync,no_root_squash)",
		require => File["/nfsshare"],
		notify => Service["nfs"],
	}
	file { "/nfsshare":
		ensure=>"directory"
	}
	package { ["nfs-utils","nfs-utils-lib"]:
		ensure => "installed"
	}
	service { "nfs":
		ensure => "running",
		enable => "true",
		require => [Package["nfs-utils"],Package["nfs-utils-lib"]]
	}
}