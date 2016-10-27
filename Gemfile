source 'https://rubygems.org'
ruby "2.1.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'

 gem 'devise'
gem 'rolify'
gem 'rails-i18n'

gem "active_model_serializers", "0.10.2"
gem "rack-cors", require: "rack/cors"
gem 'mailchimp-api', require: 'mailchimp'
gem 'kaminari'
gem "twitter"

# Env var config
gem 'figaro'

# Email service
gem 'postageapp', git: 'git://github.com/postageapp/postageapp-ruby.git', branch: 'rails4'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'coffee-rails', '~> 4.0.0.rc1'

group :production, :staging, :development do
  gem 'unicorn'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails', '~> 3.2.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem "vcr"
  gem "webmock"
  gem "database_cleaner"
end

group :test, :development do
  gem 'pry'
end

group :staging, :production do
  gem 'pg', '0.14.1'
end
