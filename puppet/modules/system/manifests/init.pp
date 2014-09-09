class system {
	service { "iptables":
		ensure => "stopped";
	}
	exec { "rsyslog":
		command => "/sbin/service rsyslog restart || exit 0"
	}
}
