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

		# TODO: refactor
		if params[:vote] == '-1' || params[:vote] == '1'
			Vote.create(entity_type: params[:entity_type].to_i, entity_id: params[:entity_id].to_i, vote: params[:vote], user_id: 0)

			if params[:entity_type] == '1'
				post = Post.find(params[:entity_id])
				if params[:vote] == -1
					post.votes_down += 1
				else
					post.votes_up += 1
				end
				post.save
			end

			redirect_to root_path
		else
			redirect_to '/fail'
		end
	end
end
