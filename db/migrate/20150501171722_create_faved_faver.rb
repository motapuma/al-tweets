class CreateFavedFaver < ActiveRecord::Migration
  def change
    create_table :faved_favers do |t|
   
    	t.integer :tweet_id
    	t.integer :user_id
    	t.timestamps
    	    
    end
  end
end
