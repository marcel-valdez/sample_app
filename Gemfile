source 'http://rubygems.org'
# Marcel added: Force ruby version 1.9.3
ruby '1.9.3'
gem 'rails', '3.1.0'
# Marcel added: Force using 0.9.3, default for ruby 1.9.3-p194
gem 'rake', '0.9.3.beta.1'
# gem 'rake', '0.9.2.2'

gem 'bootstrap-sass'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

group :development, :test do
  gem 'rspec-rails'
  # Marcel added: Used for executing code coverage on the tests.
  gem 'simplecov'
  # Marcel added: Used for automatically calling tests upon a modification of the targets or the test itself.
  gem 'guard-rspec'
end

group :development do
  gem 'annotate'
end

group :test do
  gem 'factory_girl_rails'
end

gem 'json'
gem 'bcrypt-ruby'

# Marcel added: Needs JavaScript runtime for it not to break
gem 'execjs', '1.4.0'
# Marcel added: ExecJS needs therubyracer to work: Its a v8 JavaScript interpreter
gem 'therubyracer'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # Marcel modified: Changed from ~> 3.1.0 to 3.1.4 (otherwise deployment does not work)
  gem 'sass-rails', "3.1.4"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'spork'
end

group :production do
  #gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

