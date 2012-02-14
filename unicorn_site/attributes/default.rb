default.unicorn_site[:port] = 80
default.unicorn_site[:default_site] = true
default.unicorn_site[:server_name] = 'example.com'
default.unicorn_site[:upstream_name] = 'unicorn'
default.unicorn_site[:root] = '/var/www/public'
default.unicorn_site[:static_routes] = %w{images javascripts stylesheets system}
default.unicorn_site[:definition_path] = '/etc/nginx/sites-available/unicorn'
