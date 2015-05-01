class RenameFollowersAndFollowingsToFollowersFollowings < ActiveRecord::Migration
    def self.up
    rename_table :followers_and_followings, :followers_followings
  end

 def self.down
    rename_table :followers_followings, :followers_and_followings
 end
end
