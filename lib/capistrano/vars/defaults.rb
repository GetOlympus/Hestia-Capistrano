# config valid only for current version of Capistrano
lock '3.4.0'

# ~~~~

# Setup Capistrano
set :log_level, fetch(:log_level, :debug)
set :keep_releases, fetch(:keep_releases, 3)

# Setup Project ~ Update these settings
set :application, fetch(:application, 'olympus-capified')
set :localurl, fetch(:localurl, 'http://www.domain.tld')

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
set :composer_install_flags, '--no-dev --no-interaction --quiet --optimize-autoloader'
set :composer_roles, :all
set :composer_working_dir, -> { fetch(:release_path) }
set :composer_dump_autoload_flags, '--optimize'
set :composer_download_url, 'https://getcomposer.org/installer'

# ~~~~

# Setup Symlinks
set :linked_files, ["app/config/env.php", "app/config/salt.php", "web/.htaccess", "web/robots.txt"]
set :linked_dirs, ["web/statics/languages", "web/statics/plugins", "web/statics/uploads"]
