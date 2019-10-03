require "test_helper"

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, args: %w[headless])
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  def self.js?
    ENV['JS'] || ENV['GUI']
  end

  driver = js? ? :selenium : :rack_test

  driven_by driver, using: ENV['GUI'] ? :chrome : :headless_chrome, screen_size: [1_400, 1_400]

  def with_host(url, subdomain:)
    url.gsub('127.0.0.1', "#{subdomain}.platform.localhost")
  end
end
