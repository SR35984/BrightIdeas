class UsersController < ApplicationController

	def index
	end

	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			return redirect_to idea_index_path
		elsif
			flash[:errors] = user.errors.full_messages
			return redirect_to :back
		end
	end

	def login
		user = User.find_by(email: params[:email])
		if user
			if user.try(:authenticate, params[:password])
				session[:user_id] = user.id
				return redirect_to idea_index_path
			end
			flash[:errors] = ['Password is incorrect']
		else
			flash[:errors] = ['Email is incorrect']
		end
		return redirect_to :back
	end

	def show
		@user = User.find(params[:id])
		@likes = @user.ideas_liked.count
		@ideas = @user.ideas.count
	end

	def logout
		reset_session
		redirect_to user_index_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :alias, :email, :password)
		end
end
