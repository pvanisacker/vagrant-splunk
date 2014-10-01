class splunk-deployment-client {
  exec { "enable-deployment-client":
    command => "/opt/splunkforwarder/bin/splunk set deploy-poll $deploymentserver_ip:8089 -auth admin:admin",
    require => [Package["splunkforwarder"],Service["splunkforwarder"],Exec["splunkforwarderpasswordchange"]],
  }
  exec { "enable-deployment-client-splunk-restart":
    command => "/opt/splunkforwarder/bin/splunk restart || exit 0",
    require => Exec["enable-deployment-client"]
  }
}