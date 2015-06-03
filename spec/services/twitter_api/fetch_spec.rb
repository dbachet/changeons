require "spec_helper"

describe TwitterApi::Fetch do
  use_vcr_cassette

  let(:client) { TwitterApi.new.client }

  subject { TwitterApi::Fetch.new(client: client) }

  specify { expect(subject.client).to eql client }

  describe "#last_tweets_and_retweets" do
    specify "should be an array of Twitter::Tweet instances" do
      expect(subject.last_tweets_and_retweets.map(&:class).uniq).to eql [Twitter::Tweet]
    end
  end

end