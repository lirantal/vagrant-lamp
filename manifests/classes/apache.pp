# Basic Puppet Apache manifest
class apache {
  package { "apache2":
    ensure => present,
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  exec { "enable-mod_rewrite":
        require => Package["apache2"],
        before => Service["apache2"],
        command => "/usr/sbin/a2enmod rewrite",
    }


}

