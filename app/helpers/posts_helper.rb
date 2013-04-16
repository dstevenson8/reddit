module PostsHelper


  def link_to_subreddit(id)
  	link_to id, '/r/' + id.to_s
  end 

end
