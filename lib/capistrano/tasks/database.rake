# Database
namespace :database do

  desc "Creates files"
  task :do_actions do
    on release_roles(:all) do

      # Ask configs
      set :database_host, ask("Enter the database hostname:".colorize(:color, :magenta), 'localhost')
      set :database_name, ask("Enter the database name:".colorize(:color, :magenta), 'database_name_here')
      set :database_user, ask("Enter the database user:".colorize(:color, :magenta), 'username_here')
      set :database_pass, ask("Enter the database password:".colorize(:color, :magenta), 'password_here', echo: false)

      set :wordpress_name, ask("Enter the admin username:".colorize(:color, :magenta), 'admin')
      set :wordpress_mail, ask("Enter the admin email address:".colorize(:color, :magenta), 'admin@domain.tld')
      set :wordpress_pass, ask("Enter the admin password:".colorize(:color, :magenta), 'password', echo: false)


      if File.exists?("#{release_path}/tmp/database.sql")
        puts "Copy database.sql file".colorize(:light_blue)
        upload! StringIO.new(File.read("#{release_path}/tmp/database.sql")), "#{shared_path}/tmp/database.sql"
      else
        puts "Create database.sql file".colorize(:green)
        io = StringIO.new("CREATE DATABASE IF NOT EXISTS `#{fetch(:database_name)}`;")
        upload! io, File.join(shared_path, "database.sql")
        execute :chmod, "644 #{shared_path}/database.sql"

        # Execute SQL request and remove temporary file
        execute :mysql, "-u #{fetch(:database_user)} -p#{fetch(:database_pass)} -h #{fetch(:database_host)} < #{shared_path}/database.sql"
        execute :rm, "#{shared_path}/database.sql"
      end


      if File.exists?("#{release_path}/app/config/env.php")
        puts "Copy env.php file".colorize(:light_blue)
        upload! StringIO.new(File.read("#{release_path}/app/config/env.php")), "#{shared_path}/app/config/env.php"
      else
        puts "Create env.php file".colorize(:green)

        if fetch(:stage) == :production then
          set :use_cache, true
          set :use_wpcron, false
          set :debug, "false"
        else
          set :use_cache, false
          set :use_wpcron, true
          set :debug, "['savequeries' => true, 'script_debug' => true, 'wp_debug_display' => true, 'wp_debug' => true]"
        end

        io = StringIO.new("<?php

/**
 * File auto-generated while first deploy.
 */
return [
  // Database
  'database' => [
    'host' => '#{fetch(:database_host)}',
    'name' => '#{fetch(:database_name)}',
    'user' => '#{fetch(:database_user)}',
    'pass' => '#{fetch(:database_pass)}',
    'charset' => 'utf8',
    'collate' => '',
    'prefix' => 'wp_',
  ],

  // WordPress configurations
  'wordpress' => [
    'home' => '#{fetch(:localurl)}',
    'siteurl' => '#{fetch(:localurl)}/cms',
    'revisions' => 3
  ],

  // Secure?
  'https' => false,

  // Default WordPress cron?
  'cron' => #{fetch(:use_wpcron)},

  // Security
  'file_edit' => false,

  // Cache
  'cache' => #{fetch(:use_cache)},

  // Debug
  'debug' => #{fetch(:debug)},
];

")
        upload! io, File.join(shared_path, "env.php")
        execute :chmod, "644 #{shared_path}/env.php"
        execute :mv, "#{shared_path}/env.php", "#{shared_path}/app/config/"
      end


      if File.exists?("#{release_path}/app/config/salt.php")
        puts "Copy salt.php file".colorize(:light_blue)
        upload! StringIO.new(File.read("#{release_path}/app/config/salt.php")), "#{shared_path}/app/config/salt.php"
      else
        puts "Create salt.php file".colorize(:green)
        set :secret_keys, capture("curl -s -k https://api.wordpress.org/secret-key/1.1/salt")

        io = StringIO.new("<?php

/**
 * File auto-generated while first deploy.
 * @link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service 
 */
#{fetch(:secret_keys)}

")
        upload! io, File.join(shared_path, "salt.php")
        execute :chmod, "644 #{shared_path}/salt.php"
        execute :mv, "#{shared_path}/salt.php", "#{shared_path}/app/config/"
      end


      puts "Execute wp-cli commands to create database".colorize(:green)
      execute :mkdir, '-p', "#{shared_path}/tmp/wpcli"
      execute "wp core download --path=#{shared_path}/tmp/wpcli --force"

      unless File.exists?("#{shared_path}/tmp/wpcli/wp-config.php")
        puts "Execute wp-cli command to generate wp-config.php file".colorize(:green)
        execute "wp core config --path=#{shared_path}/tmp/wpcli --dbname=#{fetch(:database_name)} --dbuser=#{fetch(:database_user)} --dbpass=#{fetch(:database_pass)}"
      end

      puts "Execute wp-cli command to install WordPress in the database".colorize(:green)
      execute "wp core install --path=#{shared_path}/tmp/wpcli --url=#{fetch(:localurl)} --title=#{fetch(:application)} --admin_user=#{fetch(:wordpress_name)} --admin_password=#{fetch(:wordpress_pass)} --admin_email=#{fetch(:wordpress_mail)}"

      execute :rm, '-rf', "#{shared_path}/tmp"

    end
  end

end
