source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use Bootstrap for rails
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
    :git => 'git://github.com/anjlab/bootstrap-rails.git',
    :branch => '3.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
gem 'unicorn'

gem "oj"

group :development, :test do
  gem 'debugger'
  gem 'factory_girl_rails'
  gem "rspec-rails", "~> 2.0"
  gem "guard", "~> 1.8.0"
  gem "guard-bundler", "~> 1.0.0"
  gem "guard-rspec", "~> 3.0.0"
  gem "pry"
  gem "pry-debugger"
  gem "pry-remote"
  gem "rb-inotify", require: false
  gem "rb-fsevent", require: false
  gem "thin"
  gem "terminal-notifier-guard"
  gem 'shoulda-matchers'
  gem 'simplecov'
end
