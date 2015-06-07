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

  describe "#tweets_and_retweets_since" do
    let(:id) { 1 }

    specify do
      expect(
        subject.tweets_and_retweets(since_id: id, count: 200).count
      ).to eql 111
      # 111 is the number of tweets and retweets available on the account at
      # the moment we recorded the cassette
    end

    specify do
      expect(
        subject.tweets_and_retweets(count: 200).count
      ).to eql 111
      # 111 is the number of tweets and retweets available on the account at
      # the moment we recorded the cassette
    end
  end

end