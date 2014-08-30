class CommentsController < ApplicationController
	def create
		@match = Match.find(params[:match_id])
		@comment = @match.comments.create(comment_params)
		redirect_to match_path(@match)
	end

	def index
	end

		def comment_params
			params.require(:comment).permit(:body)
		end
end
