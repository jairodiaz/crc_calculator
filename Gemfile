source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem "bson_ext", "~> 1.2.4"
gem "mongoid", "2.0.0.rc.7 "
gem "haml", ">= 3.0.25"
gem "nifty-generators", :group => :development
gem "calculated", "0.1.6"
gem 'cucumber-rails', :group => :test

gem "jquery-rails"

group :test do
  gem "database_cleaner", "0.6"
  gem "test-unit"
  gem "fuubar"
  gem "rspec", "~> 2.5.0"
  gem "rspec-rails", "~> 2.5.0"
  gem "autotest"
  gem 'factory_girl',         '~> 1.3'
  
  # == Acceptance
  gem 'vcr',                '~> 1.5', :require => false
  gem 'webmock',            '~> 1.6', :require => false
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'selenium-webdriver', '0.1.2'
end


group :development, :test do
  gem "rspec-rails",        "~> 2.5.0"
  gem "mocha", :group => :test

  gem 'nokogiri'
  gem 'pickle'
end

