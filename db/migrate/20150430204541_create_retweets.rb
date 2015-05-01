class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|

    	t.integer :user_id
    	t.integer :retweeting_tweet

    	t.timestamps
    end
  end
end
