class system {
	service { 'iptables':
		ensure => 'stopped';
	}
}
