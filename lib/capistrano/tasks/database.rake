# Database
namespace :database do

  desc "Creates database"
  task :do_actions do
    on release_roles(:all) do

      # Create database
      puts " "
      puts "> Create database.sql file".colorize(:light_blue)

      io = StringIO.new("CREATE DATABASE IF NOT EXISTS `#{fetch(:database_name)}`;")
      upload! io, File.join(shared_path, "database.sql")

      execute :chmod, "644 #{shared_path}/database.sql"
      execute :mysql, "-u #{fetch(:database_user)} -p#{fetch(:database_pass)} -h #{fetch(:database_host)} < #{shared_path}/database.sql"
      execute :rm, "#{shared_path}/database.sql"

      puts "end :database:do_actions".colorize(:light_blue)
      puts " "

    end
  end

  desc "Install WP"
  task :wp_cli do
    on release_roles(:all) do

      # Execute WordPress SQL requests
      puts " "
      puts "> Execute wp-cli commands to install WordPress SQL requests".colorize(:light_blue)

      execute :mkdir, '-p', "#{shared_path}/tmp/wpcli"
      execute "wp core download --path=#{shared_path}/tmp/wpcli --force"

      puts "Execute wp-cli command to generate wp-config.php file".colorize(:light_blue)
      execute "wp core config --path=#{shared_path}/tmp/wpcli --dbname=#{fetch(:database_name)} --dbuser=#{fetch(:database_user)} --dbpass=#{fetch(:database_pass)}"

      execute "wp core install --path=#{shared_path}/tmp/wpcli --url=#{fetch(:localurl)} --title=#{fetch(:application)} --admin_user=#{fetch(:wordpress_name)} --admin_password=#{fetch(:wordpress_pass)} --admin_email=#{fetch(:wordpress_mail)}"
      execute :rm, '-rf', "#{shared_path}/tmp"

      puts "end :database:wp_cli".colorize(:light_blue)
      puts " "

    end
  end

end
