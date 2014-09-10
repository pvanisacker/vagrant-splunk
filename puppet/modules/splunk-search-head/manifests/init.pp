class splunk-search-head {
  exec { "enable-search-head":
    command => "/opt/splunk/bin/splunk edit cluster-config -mode searchhead -master_uri https://$master_ip:8089 -auth admin:admin || exit 0",
    require => [Package["splunk"],Service["splunk"],Exec["splunkpasswordchange"]],
  }
  exec { "enable-search-head-splunk-restart":
    command => "/opt/splunk/bin/splunk restart || exit 0",
    require => Exec["enable-search-head"]
  }
}
