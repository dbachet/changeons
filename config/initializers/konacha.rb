Konacha.configure do |config|
  # config.stylesheets  = %w(dashboard)
  require 'capybara/poltergeist'
  Capybara.register_driver :poltergeist_slow do |app|
    Capybara::Poltergeist::Driver.new app, js_errors: false, timeout: 1.minute
  end
  config.driver = :poltergeist_slow

  Capybara.server do |app, port|
    require 'rack/handler/thin'
    Rack::Handler::Thin.run(app, Port: port)
  end
end if defined?(Konacha)
