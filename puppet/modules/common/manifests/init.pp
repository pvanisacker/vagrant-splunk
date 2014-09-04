	define common::tarball($pkg_tgz, $source_path, $install_dir) {
		# download the tgz file
		file { "$pkg_tgz":
			path    => "/tmp/$pkg_tgz",
			source  => "$source_path/$pkg_tgz",
			notify  => Exec["untar $pkg_tgz"],
		}
		# untar the tarball at the desired location
		exec { "untar $pkg_tgz":
			command => "/bin/tar xzvf /tmp/$pkg_tgz -C $install_dir/",
			require => File["/tmp/$pkg_tgz"],
		}
	}
