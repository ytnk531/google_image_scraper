# frozen_string_literal: true

require_relative 'google_image_scraper/version'
require_relative 'google_image_scraper/file_saver'
require_relative 'google_image_scraper/scraper'
require 'logger'

# Google image scraper
module GoogleImageScraper
  Logger = ::Logger.new($stdout)

  class Error < StandardError; end
end
