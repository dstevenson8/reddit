class PostsController < ApplicationController


	def main
		@posts = Post.limit(10)


		if signed_in? 
			post_ids = []
			@posts.each do |p|
				post_ids << p.id
				p[:voted] = 0
			end
			votes = Vote.where('user_id = ? AND entity_id IN (?)', current_user.id, post_ids)
			
			votes.each do |v|
				@posts.each do |p|
					if v.entity_id == p.id
						p[:voted] = v.vote
					end 
				end
			end
		end


	end

	def board
		@posts = Post.where('subreddit_id LIKE ?', params[:board])
		render json: @posts
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def vote
		if signed_in? && Vote.add_vote(params[:entity_type].to_i, params[:entity_id].to_i, current_user.id, params[:vote].to_i)
			render json: { status: :success } 
		else
			render json: { status: :fail } 
		end
	end
end
