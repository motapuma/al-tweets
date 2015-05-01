module TweetsHelper

	def correct_txt_and_class_fav(current_user,tweet)
		faved =  current_user.faved?(tweet)

		txt          = faved ? "UnFav" : "Fav"
		button_class = faved ? "btn btn-danger btn-lg" : "btn btn-warning btn-lg"
		
		return txt, button_class , faved
	end

	def correct_txt_and_class_retweet(current_user,tweet)
		retweeted =  current_user.retweeted?(tweet)

		txt          = retweeted ? "UnRetweet" : "Retweet"
		button_class = retweeted ? "btn btn-danger btn-lg" : "btn btn-info btn-lg"
		
		return txt, button_class , retweeted
	end

end