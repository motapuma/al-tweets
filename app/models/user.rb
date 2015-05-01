class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets


  has_and_belongs_to_many :followers , join_table: "followers_followings",foreign_key:"following_id",class_name: "User",association_foreign_key:"follower_id"
  has_and_belongs_to_many :followings, join_table: "followers_followings",foreign_key:"follower_id",class_name: "User",association_foreign_key:"following_id"

  has_and_belongs_to_many :faveds,  join_table: "faved_favers",class_name: "Tweet"
  has_and_belongs_to_many :retweets, join_table: "retweets",class_name: "Tweet"


  def follows?(user)
    return self.followings.include?(user)
  end

  def faved?(tweet)
    return self.faveds.include?(tweet)
  end
  def retweeted?(tweet)
    return self.retweets.include?(tweet)
  end


  def timeline_tweets
    tweets = []
    self.followings.map{ |user| tweets.concat(user.tweets) }
    return tweets
  end

  def tweets_with_retweets

    tweets = self.tweets.to_a.concat(self.retweets.to_a)
  
    return tweets.to_a

  end

  
end
