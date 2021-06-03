Legion::Cache
=====

Legion::Cache is a wrapper class to handle requests to the caching tier. It supports both memcached and redis

Supported Ruby versions and implementations
------------------------------------------------

Legion::Json should work identically on:

* JRuby 9.2+
* Ruby 2.4+


Installation and Usage
------------------------

You can verify your installation using this piece of code:

```bash
gem install legion-cache
```

```ruby
require 'legion/cache'

Legion::Cache.setup
Legion::Cache.connected? # => true
Legion::Cache.set('foobar', 'testing', ttl: 10)
Legion::Cache.get('foobar') # => 'testing'
sleep(11)
Legion::Cache.get('foobar') # => nil

```

Settings
----------

```json
{
  "driver": "dalli",
  "servers": [
    "127.0.0.1:11211"
  ],
  "connected": false,
  "enabled": true,
  "namespace": "legion",
  "compress": false,
  "cache_nils": false,
  "pool_size": 10,
  "timeout": 10,
  "expires_in": 0
}
```

Authors
----------

* [Matthew Iverson](https://github.com/Esity) - current maintainer
