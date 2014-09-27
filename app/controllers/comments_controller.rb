class CommentsController < ApplicationController
	load_and_authorize_resource

	def new
	end

	def create
		@match = Match.find(params[:match_id])
		@comment.user = current_user
	
		@comment = @match.comments.create(comment_params)
		redirect_to match_path(@match)
	end

	def edit
	end

	def update
		if @comment.update_attributes(params[:comment])
			flash[:notice] = "Successfully updated comment."
			redirect_to match_path(@match)
		else
			render :action => 'edit'
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Successfully destroyed comment."
		redirect_to match_path(@match)
	end

	def index
	end

	def comment_params
		params.require(:comment, :author_name).permit(:body)
	end
end
