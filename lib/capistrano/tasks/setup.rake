namespace :deploy do
  task :example do
    on roles(:app) do
      execute 'echo Hello World!!!'
    end
  end

  desc "Symlink shared config files"
  task :symlink_config_files do
    on roles(:app) do
      execute "ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
    end
  end
  task :restart_apache do
    on roles(:app) do
      execute "sudo apachectl restart"
    end
  end
end



after "deploy", "deploy:example"
after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart_apache"