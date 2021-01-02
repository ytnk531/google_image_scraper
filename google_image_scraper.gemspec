# frozen_string_literal: true

require_relative 'lib/google_image_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'google_image_scraper'
  spec.version       = GoogleImageScraper::VERSION
  spec.authors       = ['Yudai Tanaka']
  spec.email         = ['ytnk531@gmail.com']

  spec.summary       = 'An image downloader using Google image search.'
  spec.description   = 'An image downloader using Google image search.'
  spec.homepage      = 'https://github.com/ytnk531/google_image_scraper'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ytnk531/google_image_scraper'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'selenium-webdriver', '~> 3.0'
end
