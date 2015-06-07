class TweetsService

  attr_reader :tweets

  def initialize(opts = {})
    @tweets = opts.fetch(:tweets, [])
  end

  def persist_tweets_to_db
    Tweet.create(tweets_attributes_array)
  end

  private

  def tweets_attributes_array
    tweets.map do |tweet|
      {
        remote_id: tweet.id,
        created_at: tweet.created_at
      }
    end
  end
end