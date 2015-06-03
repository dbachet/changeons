class TwitterApi::Fetch

  attr_reader :client

  def initialize(opts = {})
    @client = opts[:client]
  end

  def last_tweets_and_retweets
    client.home_timeline
  end
end