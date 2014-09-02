class splunk::sideview_utils (){
	splunk::tarball{"$sideview_utils_tgz":
		source_path => "file:///vagrant/apps/",
		install_dir => "/opt/splunk/etc/apps/",
		pkg_tgz     => "$sideview_utils_tgz",
	}
}
