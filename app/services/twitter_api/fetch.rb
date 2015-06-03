class TwitterApi::Fetch

  attr_reader :client

  def initialize(opts = {})
    @client = opts[:client]
  end

  def last_tweets_and_retweets
    client.home_timeline
  end

  def tweets_and_retweets(opts = {})
    client
      .user_timeline(opts_with_default_user(opts))
      .reverse
  end

  private

  def opts_with_default_user(opts)
    opts.fetch(:screen_name, "ChangeonsOrg")
    opts
  end
end