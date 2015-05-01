module UsersHelper
	def correct_txt_and_class_follow(current_user,user)
		followed =  current_user.follows?(user)

		txt          = followed ? "Unfollow" : "Follow"
		button_class = followed ? "btn btn-danger btn-lg" : "btn btn-primary btn-lg"
		
		return txt, button_class , followed
	end

end