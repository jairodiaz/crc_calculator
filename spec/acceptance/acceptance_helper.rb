require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require "capybara/rspec"
require 'capybara/rails'

Capybara.default_selector = :css
Capybara.default_driver   = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Driver::Selenium.new(app, :browser => :chrome)
end

RSpec.configure do |config|
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}