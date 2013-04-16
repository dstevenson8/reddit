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
		if signed_in? && Vote.add_vote(params[:entity_type].to_i, params[:entity_id].to_i, current_user.id, params[:vote].to_i)
			render json: { status: :success } 
		else
			render json: { status: :fail } 
		end
	end
end
