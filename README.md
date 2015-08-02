# twitter-raffle

Runs raffles on twitter, based on a hashtag

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "zamith/twitter-raffle"
end
```

## Usage

```crystal
require "twitter-raffle"

p Twitter::Raffle::FinderOfWinners.new("hashtag").winner
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/twitter-raffle/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [your-github-name](https://github.com/[your-github-name]) Zamith - creator, maintainer
