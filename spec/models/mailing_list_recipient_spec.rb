require "spec_helper"

describe MailingListRecipient do

  subject { MailingListRecipient.new }

  describe "Validation" do

    context "when not valid" do

      specify { expect( subject ).to_not be_valid }

      specify do
        subject.email = "hum"
        expect( subject ).to_not be_valid
      end
    end

    context "when valid" do

      specify do
        subject.email = "testing-email@changeons.org"
        expect( subject ).to be_valid
      end
    end
  end
end