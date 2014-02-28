source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

gem 'devise', git: 'git://github.com/plataformatec/devise.git', branch: 'rails4'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git', branch: 'v3.0.0.rc'
gem 'cancan'
gem 'rolify'
gem 'rails-i18n'
gem 'fancybox2-rails', '~> 0.2.4'


# Env var config
gem 'figaro'

# Email service
gem 'postageapp', git: 'git://github.com/postageapp/postageapp-ruby.git', branch: 'rails4'

# Template
gem 'slim'

# icons library
gem 'font-awesome-rails'

# Bootstrap easy to configure navbar
gem 'rails_bootstrap_navbar'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'uglifier'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass'
  gem 'ember-rails'
  gem 'ember-source', '1.5.0.beta.1.1'
  gem 'ember-data-source', '1.0.0.beta.6'
  gem 'emblem-rails'
  gem 'font-awesome-sass'
  gem 'chosen-rails'
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
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
end

group :staging, :production do
  # Heroku needed gems for rails 4
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'pg', '0.14.1'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'debugger'
