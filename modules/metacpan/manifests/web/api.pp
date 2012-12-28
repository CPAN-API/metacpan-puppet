class metacpan::web::api {
	nginx::vhost { "api.metacpan.org":
		bare => true,
		ssl  => true,
	}

	nginx::proxy { "api-root":
		target   => "http://localhost:5000",
		vhost    => "api.metacpan.org",
		location => "",
	}

	nginx::proxy { "api-v0":
		target   => "http://localhost:5000",
		vhost    => "api.metacpan.org",
		location => "/v0",
	}

	startserver { "metacpan-api":
		root    => "/home/metacpan/api.metacpan.org",
		perlbin => $perlbin,
	}->
	service { "metacpan-api":
		ensure => running,
		enable => true,
		require => Service[ 'elasticsearch' ],
	}
}