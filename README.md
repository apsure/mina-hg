# Mina::Hg

Integrate Mercurial into Mina

## Installation

Add this line to your application's Gemfile:

    gem 'mina-hg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-hg

## Usage

In your deploy.rb add this

```
require 'mina/hg'
```

Then instead of a git clone you'll want to do an hg clone.

```
invoke :'hg:clone'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mina-hg/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
