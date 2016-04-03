# config valid only for current version of Capistrano
lock '3.4.0'

# ~~~~

# Setup Capistrano
set :log_level, fetch(:log_level, :debug)
set :keep_releases, fetch(:keep_releases, 3)

# Setup Project
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
# Nothing to customize
SSHKit.config.command_map[:composer] = "php #{fetch(:shared_path).join("composer.phar")}"

# ~~~~

# Setup Symlinks
set :linked_files, ["app/config/env.php", "app/config/salt.php", "web/.htaccess", "web/robots.txt"]
set :linked_dirs, ["web/statics/languages", "web/statics/plugins", "web/statics/uploads"]
