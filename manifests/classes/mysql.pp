class mysql {

	user { "mysql":
    ensure => present,
	  require => Package["mysql-server"],
	}

	package { "mysql-server" :		ensure => installed }
	package { "phpmyadmin":			ensure=>installed }

 	service { "mysql":
    ensure  => running,
 	  enable  => true,
 	  require => Package["mysql-server"],
 	 }

	exec { "set-mysql-password":
    unless  => "mysql -uroot -proot",
    path    => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password root",
    require => Service["mysql"],
  }

}
