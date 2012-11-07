# FileCache

What does it do? You give FileCache the URL of a file and FileCache makes sure
that it has the file stored on disk. You can retrieve your files with the same
URL you used to save the file.

## Installation

Add this line to your application's Gemfile:

    gem 'file_cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_cache

## Usage

```ruby
# to save an image in the cache
FileCache.put('http://example.com/1234abc.jpg')
#=> nil

# to get an image from the cache
FileCache.get('http://example.com/1234abc.jpg')
#=> #<File:1234abc.jpg>
# or
#=> nil # if the file isn't stored in the cache

# to get a file no matter if it was stored in the cache or not
# this will get the file from disk or download it and save it in the cache
FileCache.pget('http://example.com/1234abc.jpg')
#=> #<File:1234abc.jpg>

# to delete an image from the cache
FileCache.del('http://example.com/1234abc.jpg')
#=> nil
```


## TODO

- option to check if an image has changed (i.e. HTTP Last-Modified)

  ```ruby
  Net::HTTP.start("example.com") do |http|
    response = http.request_head('/1352127364208.png')
    puts response['Last-Modified']
  end
  ```

- option to change the path of the cache


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
