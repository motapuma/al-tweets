class Tweet < ActiveRecord::Base
	default_scope{order('created_at DESC')}

	belongs_to :user
	belongs_to :quoting_tweet,class_name:"Tweet",foreign_key:"quote_tweet",foreign_type:"integer"

	has_and_belongs_to_many :favers,     join_table: "faved_favers",class_name: "User"
	has_and_belongs_to_many :retweeters, join_table: "retweets",    class_name: "User"

	validates_length_of :tweet_text, :minimum => 5, :maximum => 314, :allow_blank => false
	
end