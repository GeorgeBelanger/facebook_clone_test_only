class LikesController < ApplicationController

	def create
		if !Like.where(status_id:like_params[:status], user_id:like_params[:user]).exists?
			@like = Like.new(status_id:like_params[:status], user_id:like_params[:user])
			@like.save
			@status = Status.find(@like.status_id)
			flash[:notice] = "You liked #{@status.title}!"
			redirect_to root_path
		else
			flash[:alert] = "You liked before!"
			redirect_to root_path
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@status = Status.find(@like.status_id)
		@like.destroy
		flash[:notice] = "You unlike."
		redirect_to @status
	end

	private

	def like_params
		params.require(:like).permit(:user, :status, :user_id, :status_id)
	end
end
