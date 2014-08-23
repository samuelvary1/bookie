module ApplicationHelper

	def avatar_url(user)
	# 	if user.avatar_url.present?
	# 		user.avatar_url
	# 	else

			default_url = "http://latimesphoto.files.wordpress.com/2013/10/1544312_sp_1009_dodgers12_wjs.jpg"
			gravatar_id = Digest::MD5::hexdigest(user.email).downcase
			"http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
		# end
	end
end
