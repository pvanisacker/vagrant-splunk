class nfsclient {
	mount { "/nfsshare":
		device => "192.168.50.3:/nfsshare",
		fstype => "nfs",
		ensure => "mounted",
		options => "defaults",
		atboot => "true",
		require => [Package["nfs-utils"],Package["nfs-utils-lib"],File["/nfsshare"]]
	}
	file { "/nfsshare":
		ensure => "directory"
	}
	package { ["nfs-utils","nfs-utils-lib"]:
		ensure => "installed"
	}
}