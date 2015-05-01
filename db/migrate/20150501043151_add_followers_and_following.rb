class AddFollowersAndFollowing < ActiveRecord::Migration
  def change
  	create_table :followers_and_followings do |t|
  		t.integer :follower
  		t.integer :following
  	end
  end
end
