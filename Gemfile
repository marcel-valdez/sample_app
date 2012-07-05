source 'http://rubygems.org'
# Marcel added: Force ruby version 1.9.3
ruby '1.9.3'
gem 'rails', '3.1.0'
# Marcel added: Force using 0.9.3, default for ruby 1.9.3-p194
gem 'rake', '0.9.3.beta.1'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

gem 'json'

# Marcel added: Needs JavaScript runtime for it not to break
gem 'execjs', '1.4.0'
# Marcel added: ExecJS needs therubyracer to work: Its a v8 JavaScript interpreter
gem 'therubyracer'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
end

group :production do
  gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

