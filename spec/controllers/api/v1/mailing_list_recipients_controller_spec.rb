require 'spec_helper'

describe Api::V1::MailingListRecipientsController do
  use_vcr_cassette

  describe 'POST#create' do
    context 'when valid email' do
      subject { post :create, mailing_list_recipient: { email: "testing-email@changeons.org" } }

      specify { expect(subject).to be_success }
    end

    context "when email is already subscribed to the list" do
      use_vcr_cassette

      let(:reponse_with_error) {
        {
          errors: {
            email: ["a déjà été ajouté à la liste"]
          }
        }.to_json
      }

      subject { post :create, mailing_list_recipient: { email: "already_subscribed@changeons.org" } }

      specify do
        expect( subject.body ).to eql reponse_with_error
      end
    end

    context 'when invalid email' do
      subject { post :create, mailing_list_recipient: { email: "testing-email@changeons" } }

      specify { expect(subject.status).to eql 422 }
    end
  end

end