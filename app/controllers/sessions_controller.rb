class SessionsController < ApplicationController

	def new
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	def create
		@user = User.where(email:session_params[:email], password:session_params[:password]).first
		if @user != nil
			session[:user_id] = @user.id
			flash[:notice] = "Welcome, #{@user.email}!"
			redirect_to(statuses_path)
		else
			flash[:alert] = "Please log in again"
			render "new"
		end
	end

	 private
	def session_params
		params.require(:session).permit(:email, :password, :password_confirmation)
	end
end
