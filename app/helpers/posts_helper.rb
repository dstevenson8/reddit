module PostsHelper


	def vote_count(post)
		post.votes_up - post.votes_down
	end

end
