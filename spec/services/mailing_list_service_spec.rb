require "spec_helper"

describe MailingListService do
  use_vcr_cassette

  let(:provider) { ::Mailchimp::API.new(Rails.application.secrets.mailchimp_api_key) }
  let(:list_id) { Rails.application.secrets.mailchimp_list_id }
  let(:email) { "testing-email@changeons.org" }

  subject { MailingListService.new(provider: provider, list_id: list_id, email: email) }

  describe "#initialize" do

    specify do
      expect( subject.provider ).to be_instance_of Mailchimp::API
      expect( subject.list_id  ).to eql list_id
      expect( subject.email    ).to eql email
    end
  end

  describe "#subscribe" do
    let(:subscribe_return) {
      {
        "email"=>"testing-email@changeons.org",
        "euid"=>"e83e469bb5",
        "leid"=>"258652313"
      }
    }

    specify do
      expect( subject.subscribe ).to eql subscribe_return
    end

    context "when email is already subscribed to the list" do
      use_vcr_cassette

      let(:email) { "already_subscribed@changeons.org" }

      specify do
        expect( subject.subscribe ).to eql :already_subscribed_to_list
      end
    end
  end
end