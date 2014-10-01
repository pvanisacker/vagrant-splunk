class splunk-deployment-server {
  file { "/opt/splunk/etc/system/local/serverclass.conf":
    ensure => "file",
    source => "puppet:///modules/splunk-deployment-server/serverclass.conf",
    require => Package["splunk"],
    notify  => Service["splunk"]
  }
}