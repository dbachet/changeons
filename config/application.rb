require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups)

module Changeons
  class Application < Rails::Application

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options, :patch], expose: :location
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr

    # rails-I18n
    config.i18n.available_locales = [:fr]

    # Force the application to not access the DB or load models when precompiling your assets
    # Heroku needs this attribute to be false
    # http://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets
    config.assets.initialize_on_precompile = false

    # From the bootstrap-saas gem
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
