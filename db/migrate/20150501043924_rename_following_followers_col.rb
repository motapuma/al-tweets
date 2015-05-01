class RenameFollowingFollowersCol < ActiveRecord::Migration
  
  def self.up
    rename_column :followers_followings, :follower, :follower_id
    rename_column :followers_followings, :following, :following_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
    rename_column :followers_followings, :follower_id , :follower
    rename_column :followers_followings, :following_id, :following
  end
end
