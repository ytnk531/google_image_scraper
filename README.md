# GoogleImageScraper

A command line tool for downloadng image from Google Image Search.

## Installation
```
$ gem install google_image_scraper
```

## Usage
Execute `google_image_scaper` with `search_word`.
If you want to limit the amount of downloaded images, specify an integer as `max_number`.

```
$ google_image_scraper search_word [max_number]
```

After execution of this command, downloaded images will be saved at a directory named current date with YYYYMMDDHHMM format(e.g. 202001011023).

e.g.
```
$ google_image_scraper cat
$ google_image_scraper cat 10
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ytnk531/google_image_scraper.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
