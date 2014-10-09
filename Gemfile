source 'https://rubygems.org'
ruby "2.1.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.rc1'

gem 'devise'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git', branch: 'v3.0.0.rc'
gem 'cancan'
gem 'rolify'
gem 'rails-i18n'
gem 'fancybox2-rails', '~> 0.2.4'


# Env var config
gem 'figaro', git: 'git://github.com/laserlemon/figaro.git', branch: 'master'

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
  gem 'ember-source', '1.7.0'
  gem 'ember-data-source', '1.0.0.beta.9'
  gem 'emblem-rails'
  gem 'font-awesome-sass'
  gem 'chosen-rails'
end

gem 'coffee-rails'
gem 'active_model_serializers'

group :production, :staging, :development do
  gem 'unicorn'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'konacha'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'poltergeist'
  gem 'thin'
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'debugger'
