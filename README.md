# Olympus Hestia Capistrano ![RubyGem Version][gem-image]
> **Olympus Hestia Capistrano** is a Ruby gem which provides a complete solution for deploying **WordPress** website easily with the **Olympus** package.

[![Olympus Component][olympus-image]][olympus-url]
[![Capistrano 3][capistrano-image]][capistrano-url]

## Features

+ Remote server automation tool with [**Capistrano**](http://capistranorb.com/)
+ Best gem dependencies with `capistrano-file-permissions` and `colorize`
+ Database update and [**wp-cli**](https://wp-cli.org/) integration
+ Tasks ready for **pagespeed**, **web servers** and **varnish**
+ And more...

## Requirements

+ [**colorize**](https://github.com/fazibear/colorize)
+ [**composer**](https://github.com/capistrano/composer)
+ [**file-permissions**](https://github.com/capistrano/file-permissions)

## Installation

You can easily install the **Olympus Hestia Capistrano** gem simply:

```sh
# In your Gemfile
gem 'capistrano',  '~> 3.4'
gem 'capistrano-olympus', '~> 0.0.8'
```

```sh
# In your Capfile
require 'capistrano/olympus'
```

To build a new `gem` file, follow these steps:

```sh
gem build capistrano-olympus.gemspec
gem push capistrano-olympus-x.x.x.gem
```

## Initialization

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

## Full example

Depending on your stage files, you can deploy simply thanks to the following command line:

```sh
bundle exec cap production deploy
```

## Release History

* 0.0.8 (May 14, 2016)

* 0.0.7 (April 11, 2016)

* 0.0.6 (April 03, 2016)
- Use our own Composer task.

## Authors and Copyright

Achraf Chouk  
[![@crewstyle][twitter-image]][twitter-url]

Please, read [LICENSE][license-blob] for more information.  
[![MIT][license-image]][license-url]

[https://github.com/crewstyle](https://github.com/crewstyle)  
[http://fr.linkedin.com/in/achrafchouk](http://fr.linkedin.com/in/achrafchouk)

## Contributing

1. Fork it (<https://github.com/GetOlympus/Hestia-Capistrano/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

---

**Built with ♥ by [Achraf Chouk](http://github.com/crewstyle "Achraf Chouk") ~ (c) since a long time.**

<!-- links & imgs dfn's -->
[olympus-image]: https://img.shields.io/badge/for-Olympus-44cc11.svg?style=flat-square
[olympus-url]: https://github.com/GetOlympus
[capistrano-image]: https://img.shields.io/badge/Capistrano-3-52C1DB.svg?style=flat-square
[capistrano-url]: https://rubygems.org/gems/capistrano-olympus
[gem-image]: https://img.shields.io/gem/v/capistrano-olympus.svg?style=flat-square
[license-blob]: https://github.com/GetOlympus/Hestia-Capistrano/blob/master/LICENSE
[license-image]: https://img.shields.io/badge/license-MIT_License-blue.svg?style=flat-square
[license-url]: http://opensource.org/licenses/MIT
[twitter-image]: https://img.shields.io/badge/crewstyle-blue.svg?style=social&logo=twitter
[twitter-url]: http://twitter.com/crewstyle
