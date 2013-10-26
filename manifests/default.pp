import 'classes/*'

# define ordering
Class['base']->Class['apache']->Class['mysql']->Class['php']

# instantiate class resources
include base
include apache
include mysql
include php
