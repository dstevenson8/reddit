class PostsController < ApplicationController

	# Show all boards
	# GET /
	def main
		@posts = Post.limit(10).order("id DESC").includes(:user) || []
		
		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end
	end

	# Show subreddit board
	# GET /r/example_subreddit
	def board
		@posts = Post.where('subreddit_id LIKE ?', params[:board]).order("id DESC").includes(:user) || []

		if signed_in?
			Vote.populate_posts(@posts, current_user)
		end

		render 'main'
	end

	# Show one post 
	# GET /r/example_subreddit/5
	def show
		@post = Post.includes(:user).find(params[:post_id])
		redirect_to root_path unless @post

		@comments = @post.comments

		if params[:comment] 
			params[:comment][:user_id] = current_user.id
			params[:comment][:post_id] = @post.id
			@new_comment = Comment.new(params[:comment])
			if @new_comment.save(params[:comment])
				redirect_to request.fullpath + '#success'
			else
				@errors = @new_comment.errors.full_messages
			end
		else
			@new_comment = Comment.new
		end
	end

	# GET /r/submit
	def new
		redirect_to :new_user_session and return unless signed_in?
		@post = Post.new
	end

	# POST /create
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

	# Voting functionality
	# AJAX GET /vote/1/1/1
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
	def point_count(post)
		post[:votes_up] ||= 0
		post[:votes_down] ||= 0
		post[:votes_up] - post[:votes_down]
	end

	helper_method :point_count
end
