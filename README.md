# Olympus Hestia Capistrano [![RubyGem Version][gem-image]][gem-url]
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
set :localurl, fetch(:localurl, 'https://www.domain.tld')
```

## Installation

You can easily install the **Olympus Hestia Capistrano** gem simply:

```sh
# In your Capfile
require 'capistrano/olympus-hestia-capistrano'
```

```sh
# In your Gemfile
gem 'capistrano',  '~> 3.4'
gem 'olympus-hestia-capistrano', '~> 0.0.9'
```

## Full example

Depending on your stage files, you can deploy simply thanks to the following command line:

```sh
bundle exec cap production deploy
```

## Contributing

1. Fork it (<https://github.com/GetOlympus/Hestia-Capistrano/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## Publishing

To publish a new `gem` file, follow these steps:

```sh
gem build olympus-hestia-capistrano.gemspec
gem push olympus-hestia-capistrano-x.x.x.gem
```

## Release History

See [**CHANGELOG.md**][changelog-blob] for all details.

## Authors and Copyright

Achraf Chouk  
[![@crewstyle][twitter-image]][twitter-url]

[https://github.com/crewstyle](https://github.com/crewstyle)  
[http://fr.linkedin.com/in/achrafchouk](http://fr.linkedin.com/in/achrafchouk)

Please, read [![MIT][license-image]][license-blob] for more information.

---

**Built with ♥ by [Achraf Chouk](http://github.com/crewstyle "Achraf Chouk") ~ (c) since a long time.**

<!-- links & imgs dfn's -->
[olympus-image]: https://img.shields.io/badge/for-Olympus-44cc11.svg?style=flat-square
[olympus-url]: https://github.com/GetOlympus
[capistrano-image]: https://img.shields.io/badge/Capistrano-3-52C1DB.svg?style=flat-square
[capistrano-url]: https://github.com/capistrano/capistrano
[changelog-blob]: https://github.com/GetOlympus/Hestia-Capistrano/blob/master/CHANGELOG.md
[gem-image]: https://img.shields.io/gem/v/olympus-hestia-capistrano.svg?style=flat-square
[gem-url]: https://rubygems.org/gems/olympus-hestia-capistrano
[license-blob]: https://github.com/GetOlympus/Hestia-Capistrano/blob/master/LICENSE
[license-image]: https://img.shields.io/badge/license-MIT_License-blue.svg?style=flat-square
[twitter-image]: https://img.shields.io/badge/crewstyle-blue.svg?style=social&logo=twitter
[twitter-url]: http://twitter.com/crewstyle
