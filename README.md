# Capistrano Olympus [![RubyGem version](https://img.shields.io/gem/v/capistrano-olympus.svg?style=flat-square)](https://rubygems.org/gems/capistrano-olympus)  

_**Capistrano Olympus** is a Ruby gem which provides a complete solution for deploying **WordPress** website easily.  
An awesome gem build with ♥ for **WordPress developers**._  
![Capistrano 3](https://img.shields.io/badge/Capistrano-3-52C1DB.svg?style=flat-square)  

---

## Features

+ Remote server automation tool with [**Capistrano**](http://capistranorb.com/)
+ Best gem dependencies with `capistrano-file-permissions` and `colorize`
+ Database update and [**wp-cli**](https://wp-cli.org/) integration
+ Tasks ready for **pagespeed**, **web servers** and **varnish**

---

## Requirements

+ [**composer**](https://github.com/capistrano/composer)
+ [**colorize**](https://github.com/fazibear/colorize)
+ [**file-permissions**](https://github.com/capistrano/file-permissions)

---

## Installation

You can easily install the **Capistrano Olympus** gem simply:

```
# In your Gemfile
gem 'capistrano',  '~> 3.4'
gem 'capistrano-olympus', '~> 0.0.8'
```

```
# In your Capfile
require 'capistrano/olympus'
```

---

## Settings

All default settings are defined in the `lib/capistrano/vars/defaults.rb` file. Please, refer to it to see exactly how the defaults are set up.  
If you want to override any setting, just set it on your `app/deploy/config.rb` file.

```ruby
# [optional] Setup files and dirs to symlink, setup web user to chown
set :files, fetch(:files, ['app/config/env.php', 'app/config/salt.php', 'web/.htaccess', 'web/robots.txt'])
set :dirs, fetch(:dirs, ['web/statics/languages', 'web/statics/plugins', 'web/statics/uploads'])
set :stage_user, fetch(:stage_user, 'www-data')

# Setup Capistrano
set :log_level, fetch(:log_level, :debug)
set :keep_releases, fetch(:keep_releases, 3)

# Setup Project
set :application, fetch(:application, 'olympus-capified')
set :localurl, fetch(:localurl, 'http://www.domain.tld')
```

---

## Deployment process

Depending on your stage files, you can deploy simply thanks to the following command line:

```
bundle exec cap production deploy
```

---

## Documentation

[To learn more about the **Olympus WordPress framework**, read the docs](https://olympus.readme.io/).  
The **Olympus WordPress framework** uses [ReadMe.io](https://readme.io) which was built entirely on Open Source projects.

---

## All we need is looooooooooooove :)

[![Salt Bountysource page](https://img.shields.io/badge/Salt%20Bountysource-♥-brightgreen.svg?style=flat-square)](https://salt.bountysource.com/teams/olympus) [![Bountysource page](https://img.shields.io/badge/Bountysource-♥-brightgreen.svg?style=flat-square)](https://www.bountysource.com/teams/olympus)  
Guys, do **not** hesitate to spread your love about the **Olympus WordPress framework** and **all its packages** ;)

---

## Authors and Copyright

**Achraf Chouk**

+ http://fr.linkedin.com/in/achrafchouk/
+ http://twitter.com/crewstyle
+ http://github.com/crewstyle

Please, read [LICENSE](https://github.com/GetOlympus/capistrano-olympus/blob/master/LICENSE "LICENSE") for more details.  
[![MIT](https://img.shields.io/badge/license-MIT_License-blue.svg?style=flat-square)](http://opensource.org/licenses/MIT "MIT")  

---

**Built with ♥ by [Achraf Chouk](http://github.com/crewstyle "Achraf Chouk") ~ (c) since 2015.**
