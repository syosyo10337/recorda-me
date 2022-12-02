# config valid for current version and patch releases of Capistrano
lock '~> 3.17.1'

set :application, 'recorda-me'
set :repo_url, 'git@github.com:syosyo10337/recorda-me.git'

set :branch, 'main'
set :deploy_to, '/var/www/recorda-me'
set :rbenv_ruby, File.read('.ruby-version').strip
set :keep_releases, 5

append :linked_files, 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'node_modules'

# Nginxの設定ファイル名と置き場所を修正
set :nginx_config_name, "#{fetch(:application)}.conf"
set :nginx_sites_enabled_path, "/etc/nginx/conf.d"
# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# set :ssh_options, verify_host_key: :secure
