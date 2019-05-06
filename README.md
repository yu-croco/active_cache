# ActiveCache

Welcome to active_cache! This RubyGem helps you to save Database access performance by caching the result of ActiveRecord object.

when you get object via ActiveRecord, the result is stored on Memcached, then the data is fetched from Memcached, insted of Database when you access the same data at second time.

```ruby
# At the first time, ActiveRecord will access to Database.
# On this time, the result data is stored on Memcached.
user = User.find(1)
# => User Load (0.3ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1

# At the second time, data is fetched from Memcached, so you can improve performance!
user = User.find(1)
# => ActiveRecord does not access to Database
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_cache'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_cache

## Usage

ActiveCache is deactive by default, so you need to activate  in your target Model like below.

```ruby
class User < ActiveRecord::Base
  self.activate_cache(true)
end
```

**Currently this RubyGem supports `find` method. Other features are comming soon, I hope.**

Additionally, you can configure the cache expiration to define in `app/config/active_cache.yml` like below.

```yml
expired_in 1.day
```

Default expiration is 1 hour.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Then, create database as following.

```
$ mysql -u root -p
$ CREATE DATABASE active_cache_test CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

On development environment we use Memcached, so please download Memcached and run server by following.

```
$ brew install memcached
$ memcached -d
```

Then, run `bin/spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_cache. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveCache project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/active_cache/blob/master/CODE_OF_CONDUCT.md).
