# config valid only for current version of Capistrano
lock '3.11.0'

set :application, 'mercari_40'
set :repo_url,  'git@github.com:wish911wish/mercari_40.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                 keys: ['/Users/kawakaminozomu/.ssh/mercari_40_key.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
 task :restart do
   invoke 'unicorn:restart'
 end
end
