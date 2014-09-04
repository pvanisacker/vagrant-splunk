class splunk-outputs {
  file { "/opt/splunkforwarder/etc/system/local/outputs.conf":
    require => Package["splunkforwarder"],
    content => template('splunk-outputs/outputs.conf.erb'),
    notify  => Service["splunk"]
  }
}
