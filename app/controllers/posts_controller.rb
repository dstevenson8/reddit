class PostsController < ApplicationController

	def main
		@posts = Post.limit(10).order("id DESC").includes(:user) || []
		
		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end
	end

	def board
		@posts = Post.where('subreddit_id LIKE ?', params[:board]).order("id DESC").includes(:user) || []

		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end

		render 'main'
	end

	def new
		redirect_to :new_user_session and return unless signed_in?
		@post = Post.new
	end

	def create
		redirect_to :new_user_session and return unless signed_in?

		params[:post][:user_id] = current_user.id;
		@post = Post.new(params[:post])
		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def vote

		if signed_in?

			vote = Vote.add_vote(params[:entity_type].to_i, params[:entity_id].to_i, current_user.id, params[:vote].to_i)
			if vote[:result]
				render json: { :status => :success, :new_rank => vote_count(vote) } 
			else
				render json: { :status => :fail, :reason => 'Failed to add vote' } 
			end
		else
			render json: { status => :fail, :reason => 'You are not signed in' } 
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
