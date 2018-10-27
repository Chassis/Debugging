# A Chassis extension to install and activate common WordPress plugins used for debugging during development
class debugging (
	$config,
	$path = '/vagrant/extensions/debugging',
	$php_version  = $config[php]
) {
	if !( File['/vagrant/content'] ) {
		file { '/vagrant/content':
		  ensure => 'directory',
		}
	}
	if !( File['/vagrant/content/plugins'] ) {
		file { '/vagrant/content/plugins':
		  ensure => 'directory',
		}
	}
	wp::plugin { 'debug-bar':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
	wp::plugin { 'debug-bar-extender':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
	wp::plugin { 'debug-bar-cron':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
	wp::plugin { 'debug-bar-transients':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
	wp::plugin { 'log-deprecated-notices':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
	wp::plugin { 'rewrite-rules-inspector':
		ensure   => enabled,
		location => '/vagrant/wp',
		require  => [ Package["php${php_version}-fpm", "php${php_version}-cli"], Class['wp'] ],
	}
}
