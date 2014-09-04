class splunk-inputs {
  file { "/opt/splunk/etc/system/local/inputs.conf":
    require => Package["splunk"],
    content => template('splunk-inputs/inputs.conf.erb'),
    notify  => Service["splunk"]
  }
}
