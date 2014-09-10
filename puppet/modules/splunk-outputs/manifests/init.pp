class splunk-outputs ($type="splunkforwarder"){
  file { "/opt/$type/etc/system/local/outputs.conf":
    require => Package["$type"],
    content => template('splunk-outputs/outputs.conf.erb'),
    notify  => Service["splunk"]
  }
}
