source 'https://rubygems.org'

gem 'rake', '< 11.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.1'
# Use mysql2 as the database for Active Record
gem "mysql2", "~> 0.3.0"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt-ruby', '3.1.2'

gem 'bootstrap-sass', '2.3.2.0'

gem 'omniauth-google-oauth2'

gem 'figaro'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'test-unit'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rails-dev-boost', git: 'https://github.com/thedarkone/rails-dev-boost'
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'pry'
  gem 'brakeman', require: false
  gem 'bullet', '~> 5.4.3'
  gem 'rubocop', require: false
  gem "forgery","0.5.0"
  gem 'factory_girl_rails', '4.4.0'
  gem 'webrick', '1.3.1'
  gem 'fakes3', '~> 1.0'
end

group :test do
  gem 'spring-commands-rspec', '1.0.4'
  gem "rspec", "3.7.0"
  gem "rspec-rails", "3.7.2"
  gem "spork", "~> 0.9.0"
  gem "mocha", "~> 0.13.0", require: false
  gem 'rspec-collection_matchers', '1.0.0'
  gem 'rack-test', '~> 0.6.2'
  gem "rr", "~> 1.1.0"
  gem "ZenTest", "4.4.1"
  gem "autotest-fsevent", "0.1.1"
  gem "autotest-growl", "0.2.0"
  gem "autotest-rails", "4.1.0"
  gem "faker", "~> 1.0.1"
  gem "simplecov", "~> 0.7.1" #0.16.1
  gem "simplecov-csv"
  gem "database_cleaner"
  gem "fuubar"
  gem "json-compare", "0.1.8"
  gem "rspec_junit_formatter" # Used by API
  gem "simplecov-rcov" 
  gem "rubocop-checkstyle_formatter" # Used by API
  gem "minitest-rails", "2.1.1" # Used by API
  gem "minitest-reporters" # Used by API
  # check if we really need these.
  # gem 'test-unit', '3.1.7'
  # gem 'test-unit-minitest', git: 'https://github.com/venkatesh-89/test-unit-minitest', branch: :master
  gem 'json_expressions' # Used by API
  gem "timecop" # Used by API
  gem "json-schema" # Used by AuditLog
  gem 'webmock' # used to mock http requests
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end