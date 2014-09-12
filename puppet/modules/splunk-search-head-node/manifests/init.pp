class splunk-search-head-node {
  exec { "enable-search-head":
    command => "/opt/splunk/bin/splunk edit cluster-config -mode searchhead -master_uri https://$master_ip:8089 -auth admin:admin || exit 0",
    require => [Exec["enable-search-head-splunk-restart"]],
  }
}
