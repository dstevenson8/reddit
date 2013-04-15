class PostsController < ApplicationController

	def main
		@posts = Post.find(:all, :limit => 10,
						   :joins => 'LEFT JOIN `votes` ON `votes`.`entity_type` = 1 AND `votes`.`entity_id` = `posts`.`id`',
						   :select => '`posts`.*, `votes`.`vote`',
						   :group => '`posts`.`id`')
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

	def vote
		if Vote.add_vote(params[:entity_type].to_i, params[:entity_id].to_i, 1, params[:vote].to_i)
			redirect_to root_path
		else
			redirect_to '/fail'
		end
	end
end
