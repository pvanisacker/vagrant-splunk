class splunk-peer-node {
  exec { "enable-peer-node":
    command => "/opt/splunk/bin/splunk edit cluster-config -mode slave -master_uri https://$master_ip:8089 -replication_port 9887 -auth admin:admin",
    require => [Package["splunk"],Service["splunk"],Exec["splunkpasswordchange"]],
  }
  exec { "enable-peer-node-splunk-restart":
    command => "/opt/splunk/bin/splunk restart || exit 0",
    require => Exec["enable-peer-node"]
  }
}