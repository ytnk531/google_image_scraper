require 'open-uri'
require 'selenium-webdriver'

module GoogleImageScraper
  class Scraper
    LARGE_PICTURE_XPATH = '/html/body/div[2]/c-wiz/div[3]' \
            '/div[2]/div[3]/div/div/div[3]/div[2]/c-wiz/div[1]/div[1]/div/div[2]/a/img'.freeze
    SEARCH_PAGE_URL_FORMAT = 'https://www.google.com/search?q=%s&source=lnms&tbm=isch'.freeze

    def initialize
      @driver = setup_driver
      @file_saver = FileSaver.new
    end

    def scrape(keyword, limit = nil)
      @driver.get search_page_url(keyword)
      img_end = limit - 1 || -1
      start = 0

      loop do
        # After 2nd time of this execution, html_elements are increased than previous execution.
        # This is because search page uses continuous loading triggered by scroll point.
        elements = @driver.find_elements(css: 'img')
        break if start == elements.size

        download_images elements[start..img_end]

        start = elements.size
        elements.last.click unless limit
      end
    end

    private

    def search_page_url(keyword)
      format(SEARCH_PAGE_URL_FORMAT, URI.encode_www_form_component(keyword))
    end

    def download_images(html_elements)
      html_elements.each do |element|
        # Show image in left side and then wait for large image will be displayed.
        element.click
        sleep(1)

        large_picture_element = @driver.find_element(:xpath, LARGE_PICTURE_XPATH)
        src = large_picture_element.attribute('src')
        @file_saver.save(src)
      rescue StandardError => e
        logger.error(e.full_message)
        next
      end
    end

    def setup_driver
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { args: %w[--headless --disable-gpu window-size=1280x8000] }
      )
      # caps = Selenium::WebDriver::Remote::Capabilities.chrome
      Selenium::WebDriver.for :chrome, desired_capabilities: caps
    end
  end
end
