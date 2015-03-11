class MailingListService

  attr_reader :provider, :list_id, :email

  def initialize(provider: provider, list_id: list_id, email: email)
    @provider = provider || mailchimp
    @list_id  = list_id
    @email    = email
  end

  def subscribe
    begin
      if %w(production test).include?(Rails.env)
        provider.lists.subscribe(list_id, { "email" => email })
      end
    rescue Mailchimp::ListAlreadySubscribedError
      false
    end
  end

  private

  def mailchimp
    ::Mailchimp::API.new(Rails.application.secrets.mailchimp_api_key)
  end
end