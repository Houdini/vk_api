## vk-api

It's simple based vkontakte ruby api library, it

* faraday base
* default json inside
* ruby 1.9 compatible only

## Getting started
Add to Gemfile:

```ruby
gem 'vk', git: 'git://github.com/Houdini/vk_api.git'
```

create client

```ruby
client = Vk.new access_token
```

get audi list

```ruby
result = client.get 'audio.get'

# first audio file artist
result.body.response[0].first.artist
```

you can pass parameters
```ruby
result = client.get 'audio.get', count: 10
```

for more information check: http://vk.com/developers.php?o=-1&p=%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%BE%D0%B2_API&s=0
