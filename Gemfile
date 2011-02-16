source 'http://rubygems.org'

gem 'rails', '3.0.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem "mongoid", ">= 2.0.0.beta.19"
gem "bson_ext", "~> 1.2"
gem "devise", "~> 1.1.6"
gem "haml", ">= 3.0.0"
gem "haml-rails"
# gem 'inherited_resources', '~> 1.2.1'
gem 'formtastic', '~> 1.1.0'
gem 'heroku', '1.17.13'

group :development do
	gem 'nifty-generators'
	gem 'hpricot', '0.8.3'
	gem 'ruby_parser', '2.0.5'
# 	gem 'populator', '0.2.5'
# 	gem 'faker', '0.9.5'
# 	gem 'random_data', '1.5.2'
# 	gem 'forgery', '0.3.6'
# 	gem 'hirb', '0.3.6'
end

gem "rspec-rails", ">= 2.0.1", :group => [:development, :test]

group :test do
	gem "cucumber-rails"
	gem "capybara"
end
gem "mocha", :group => :test
