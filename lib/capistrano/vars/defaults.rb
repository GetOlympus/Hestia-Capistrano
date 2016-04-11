# ~~~~

# Setup Git
set :repo_url, 'git@github.com:crewstyle/Olympus.git'
set :scm, :git
set :git_enable_submodules, true

# Setup SSH
set :copy_exclude, ['.git', '.DS_Store', '.gitignore', '.gitmodules']
set :use_sudo, false
set :ssh_options, {
  forward_agent: true
}

# ~~~~

# Setup Composer
set :composer_flags, '--no-dev --prefer-dist --optimize-autoloader'
set :composer_install_flags, fetch(:composer_flags)

# ~~~~

# Setup Symlinks
set :linked_files, ["app/config/env.php", "app/config/salt.php", "web/.htaccess", "web/robots.txt"]
set :linked_dirs, ["web/statics/languages", "web/statics/plugins", "web/statics/uploads"]

# ~~~~

# Setup Database
set :database_host, ask("Enter the database hostname:".colorize(:magenta), 'localhost')
set :database_name, ask("Enter the database name:".colorize(:magenta), 'database_name_here')
set :database_user, ask("Enter the database user:".colorize(:magenta), 'username_here')
set :database_pass, ask("Enter the database password:".colorize(:magenta), 'password_here', echo: false)

# Setup WordPress
set :wordpress_name, ask("Enter the admin username:".colorize(:magenta), 'admin')
set :wordpress_mail, ask("Enter the admin email address:".colorize(:magenta), 'admin@domain.tld')
set :wordpress_pass, ask("Enter the admin password:".colorize(:magenta), 'password', echo: false)
