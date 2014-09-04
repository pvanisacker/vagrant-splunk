class loadgen {
	file { "/usr/local/bin/loadgen.bash":
		source => "puppet:///modules/loadgen/loadgen.bash",
		mode => "755"
	}
	exec { "/usr/local/bin/loadgen.bash":
		command => "/usr/bin/nohup /usr/local/bin/loadgen.bash 2> /dev/null &",
		require => File["/usr/local/bin/loadgen.bash"]
	}
}