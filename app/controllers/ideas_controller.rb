class IdeasController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@ideas = Idea.all

	end
	
	def create
		idea = Idea.create(idea_params)
		return redirect_to idea_index_path

	end
	
	def show
		@idea = Idea.find(params[:id])
		@users = @idea.users
	end
	
	private
		def idea_params
			params.require(:ideas).permit(:content).merge(user_id: session[:user_id])
		end
end
