class CreateTweetsUsers < ActiveRecord::Migration
  def change
    create_table :tweets_users do |t|
    	t.integer :tweet_id
    	t.integer :user_id
    	t.timestamps
    end
  end
end
