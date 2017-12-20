class LikesController < ApplicationController

	def create
		user = User.find(session[:user_id])
		idea = Idea.find(params[:likes]['idea_id'])
		likes = Like.create(user: user, idea: idea)
		redirect_to "/bright_ideas"
	end

	private
		def like_params
			params.require(:likes).permit(:idea_id).merge(user: session[:user_id])
		end
end
