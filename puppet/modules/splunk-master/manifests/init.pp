class splunk-master ($rep_factor=3,$search_factor=2) {
  exec { "enable-master":
    command => "/opt/splunk/bin/splunk edit cluster-config -mode master -replication_factor $rep_factor -search_factor $search_factor -auth admin:admin",
    require => [Package["splunk"],Service["splunk"],Exec["splunkpasswordchange"]],
  }
  exec { "enable-master-splunk-restart":
    command => "/opt/splunk/bin/splunk restart || exit 0",
    require => Exec["enable-master"]
  }
}