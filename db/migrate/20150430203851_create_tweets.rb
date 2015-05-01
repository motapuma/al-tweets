class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

    	t.text :tweet_text, default:nil, limit:314
    	t.integer :user_id
    	t.integer :replying_tweet
    	t.integer :quote_tweet

      	t.timestamps
    end
  end
end
