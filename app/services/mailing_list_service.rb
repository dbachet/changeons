class MailingListService

  attr_reader :provider, :list_id, :email

  def initialize(provider: provider, list_id: list_id, email: email)
    @provider = provider || mailchimp
    @list_id  = list_id
    @email    = email
  end

  def subscribe
    if %w(production test).include?(Rails.env)
      provider.lists.subscribe(list_id, { "email" => email })
    end
  end

  private

  def mailchimp
    ::Mailchimp::API.new(Rails.application.secrets.mailchimp_api_key)
  end
end