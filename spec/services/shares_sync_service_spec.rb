require "spec_helper"

describe SharesSyncService do
  use_vcr_cassette

  let!(:already_persisted_tweet_1) { create :tweet, remote_id: 10 }
  let!(:already_persisted_tweet_2) { create :tweet, remote_id: 11 }

  let(:tweets) do
    TwitterApi::Fetch
      .new(client: TwitterApi.new.client)
      .tweets_and_retweets(
        since_id: already_persisted_tweet_2.remote_id,
        count: 200
      )
  end

  subject { SharesSyncService.new() }

  specify { expect( subject.tweets   ).to eql tweets }
  specify { expect( subject.since_id ).to eql already_persisted_tweet_2.remote_id }
  specify do
    expect{ subject.perform  }.to change{ Tweet.count }.from(2).to(113)
    # 111 is the number of tweets and retweets available on the account at the moment we recorded the cassette
  end
end