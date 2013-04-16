class PostsController < ApplicationController


	def main
		@posts = Post.limit(10).order("id DESC")
		@posts ||= []
		
		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end
	end

	def board
		@posts = Post.where('subreddit_id LIKE ?', params[:board]).order("id DESC")
		@posts ||= []

		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end

		render 'main'
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
		render json: { status => :fail, :reason => 'You are not signed in' } unless signed_in?

		vote = Vote.add_vote(params[:entity_type].to_i, params[:entity_id].to_i, current_user.id, params[:vote].to_i)
		if vote[:result]
			render json: { :status => :success, :new_rank => vote_count(vote) } 
		else
			render json: { :status => :fail, :reason => 'Failed to add vote' } 
		end
	end


	# Methods needed both in the controller and view
	private
	def vote_count(post)
		post[:votes_up] ||= 0
		post[:votes_down] ||= 0
		post[:votes_up] - post[:votes_down]
	end

	helper_method :vote_count
end
