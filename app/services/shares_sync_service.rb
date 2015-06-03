# Public: Fetch tweets from @ChangeonsOrg twitter account
#         and save their `id` on local DB in Tweet table.
#         You can also pass the tweets in params if you want to save
#         them on local DB
#
# since_id  - optional - The ID of the user for whom to return results for
# tweets    - optional - Tweets to save on DB. i.e. [<#Object id: 1, created_at: ...]
#
# Examples
#
#   SharesSyncService.new(2134).perform
#   # => nil
#
class SharesSyncService

  attr_reader :tweets, :since_id

  def initialize(opts = {})
    @since_id = opts[:since_id] || default_id
    @tweets = opts[:tweets] || default_tweets
  end

  def perform
    sync_db
  end

  private

  def default_id
    biggest_tweet_id_in_db || 1
  end

  def biggest_tweet_id_in_db
    # Returns nil if no Tweet in DB
    Tweet
      .select(:remote_id)
      .order(remote_id: :desc)
      .first.try(&:remote_id)
  end

  def default_tweets
    TwitterApi::Fetch
      .new(client: TwitterApi.new.client)
      .tweets_and_retweets(since_id: since_id, count: 200)
  end

  def sync_db
    TweetsService
      .new(tweets: tweets)
      .persist_tweets_to_db
  end
end