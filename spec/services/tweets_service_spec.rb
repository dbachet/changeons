require "spec_helper"

describe TweetsService do
  use_vcr_cassette

  let(:tweets) do
    TwitterApi::Fetch
      .new(client: TwitterApi.new.client)
      .last_tweets_and_retweets
  end

  subject { TweetsService.new(tweets: tweets) }

  specify { expect(subject.tweets).to eql tweets }
  specify { expect { subject.persist_tweets_to_db }.to change { Tweet.count }.from(0).to(19) }

end