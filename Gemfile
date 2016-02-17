source 'https://rubygems.org'

# Specify ruby version for heroku
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use sqlite3 as the database for Active Record
group :development,:test do
  gem 'capybara'
  gem 'json'
  gem 'pry-rails'
  gem "rspec-its"
  gem 'rspec-rails', '~> 3.0'
  gem "shoulda-matchers"
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' # need this for asset compilation on heroku
  gem 'unicorn'
end

group :development do
  gem "web-console", "~> 2.0"
end

group :test do
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks", "~> 2.5.3"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'nokogiri'
gem "geocoder"
gem "rails_autolink"
gem "haml"
gem "simple_form"
gem "figaro"
gem "activeadmin", '~> 1.0.0.pre2'
gem "devise"
gem 'bootstrap-sass', '~> 3.3.6'
gem "font-awesome-rails"


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
