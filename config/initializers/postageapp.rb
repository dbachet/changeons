PostageApp.configure do |config|
  config.api_key = ENV['POSTAGEAPP_KEY']
  config.recipient_override = 'admin@changeons.org' unless Rails.env.production?
end
