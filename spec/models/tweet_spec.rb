require "spec_helper"

describe Tweet do
  describe "testing validations" do
    let(:tweet) { build :tweet }
    subject { tweet }

    it { should be_valid }
    it { subject.save.should be_truthy }

    context "testing uniqueness validation on remote_id attribute" do
      let(:another_tweet) { build :tweet, remote_id: tweet.remote_id }
      before { tweet.save }

      it { another_tweet.should_not be_valid }
      it { another_tweet.save.should_not be_truthy }
    end
  end
end