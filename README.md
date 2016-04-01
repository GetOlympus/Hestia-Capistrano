# Capistrano Olympus [![RubyGem version](https://img.shields.io/gem/v/capistrano-olympus.svg?style=flat-square)](https://rubygems.org/gems/capistrano-olympus)  

_**Capistrano Olympus** is a Ruby gem which provides a complete solution for deploying **WordPress** website easily.  
Build with ♥ for **WordPress developers**._  

---

[![Total Downloads](https://img.shields.io/packagist/dt/crewstyle/capistrano-olympus.svg?style=flat-square)](https://packagist.org/packages/crewstyle/capistrano-olympus) 
[![GitHub version](https://img.shields.io/github/tag/crewstyle/capistrano-olympus.svg?style=flat-square)](https://github.com/crewstyle/capistrano-olympus) 
![For Olympus](https://img.shields.io/badge/for-Olympus-75cd45.svg?style=flat-square) 
![For WordPress](https://img.shields.io/badge/for-WordPress-00aadc.svg?style=flat-square) - 
![Capistrano 3](https://img.shields.io/badge/Capistrano-3-52C1DB.svg?style=flat-square)  

---

**Capistrano Olympus** works especially with the [**Olympus framework**](https://github.com/crewstyle/Olympus) and [**Capistrano 3**](http://capistranorb.com/).  
It depends on the following Capistrano tasks to deploy a WordPress application:

+ capistrano-composer: https://github.com/capistrano/composer
+ sshkit-sudo: https://github.com/kentaroi/sshkit-sudo

---

### Installation

Require `capistrano-olympus` in your gem file:

```
# Gemfile
gem 'capistrano',  '~> 3.4'
gem 'capistrano-olympus', '~> 0.0.1'
```

### Usage

Require `capistrano-olympus` in your cap file:

```
# Capfile
require 'capistrano/olympus'
```

---

### Settings

All default settings are defined in the `lib/capistrano/vars/defaults.rb` file. Please, refer to it to see exactly how the defaults are set up.  
If you want to override any setting, just set it on your `app/deploy/stages/:stage.rb` file.

```ruby
# Config valid only for current version of Capistrano
lock '3.4.0'

# ~~~~

# Setup Capistrano
set :log_level, :debug
set :keep_releases, 3

# Setup Project
set :application, 'olympus-capified'
set :localurl, 'http://www.domain.tld'

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
set :linked_files, ["app/config/env.php", "web/.htaccess", "web/robots.txt"]
set :linked_dirs, ["web/statics/languages", "web/statics/plugins", "web/statics/uploads"]

```

---

### All we need is looooooooooooove :)

[![Salt Bountysource page](https://img.shields.io/badge/Salt%20Bountysource-♥-brightgreen.svg?style=flat-square)](https://salt.bountysource.com/teams/olympus) [![Bountysource page](https://img.shields.io/badge/Bountysource-♥-brightgreen.svg?style=flat-square)](https://www.bountysource.com/teams/olympus)  
Guys, do **not** hesitate to spread your love about the **Olympus WordPress framework** and **all its packages** ;)

---

### Authors and Copyright

**Achraf Chouk**

+ http://fr.linkedin.com/in/achrafchouk/
+ http://twitter.com/crewstyle
+ http://github.com/crewstyle

Please, read [LICENSE](https://github.com/crewstyle/capistrano-olympus/blob/master/LICENSE "LICENSE") for more details.  
[![MIT](https://img.shields.io/badge/license-MIT_License-blue.svg?style=flat-square)](http://opensource.org/licenses/MIT "MIT")  

---

**Built with ♥ by [Achraf Chouk](http://github.com/crewstyle "Achraf Chouk") ~ (c) since 2015.**
