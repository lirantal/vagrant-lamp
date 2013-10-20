class php {

  package {
		"php5" :
			ensure => installed,
  }
  package {
		"php5-cli" :
			ensure => installed,
  }
  package {
		"php5-xdebug" :
			ensure => installed,
  }
  package {
		"libapache2-mod-php5" :
			ensure   => installed,
			require  => Package["php5"]
  }

  package { "php5-mysql": ensure => installed }

  package { "php5-curl": ensure => installed }

  package { "php5-gd": ensure => installed }

  package { "php-xml-parser": ensure => installed }

  package { "php-pear": ensure => installed }

  # Update this to use your respective time zone value
  exec { 'php_config':
    command => '/bin/sed -i "s/^;date.timezone =/date.timezone = \'Israel\/Jerusalem\'/g" /etc/php5/apache2/php.ini',
    require => Package['php5'],
  }

}
