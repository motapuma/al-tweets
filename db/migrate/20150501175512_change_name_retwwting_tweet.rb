class ChangeNameRetwwtingTweet < ActiveRecord::Migration
  def change
  	rename_column :retweets, :retweeting_tweet, :tweet_id
  end
end
