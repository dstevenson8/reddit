class PostsController < ApplicationController

	def main
		@posts = Post.all


	end

	def board(board)
		#@posts = Post.find()
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
end
