# config valid only for current version of Capistrano
lock '3.11.0'

set :application, 'mercari_40'
set :repo_url,  'git@github.com:wish911wish/mercari_40.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, %w{ .env config/secrets.yml }

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                 keys: ['/Users/kawakaminozomu/.ssh/mercari_40_key.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID_MER40: ENV["AWS_ACCESS_KEY_ID_MER40"],
  AWS_SECRET_ACCESS_KEY_MER40: ENV["AWS_SECRET_ACCESS_KEY_MER40"]
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload secrets.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
      upload!('.env', "#{shared_path}/.env")
      upload!('db/users.csv', "#{shared_path}/db/users.csv")
      upload!('db/items.csv', "#{shared_path}/db/items.csv")
    end
  end

  task :db_reset do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
        end
      end
    end
  end

  task :db_seed do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'

end
