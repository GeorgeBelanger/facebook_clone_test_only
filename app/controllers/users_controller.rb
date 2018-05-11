class UsersController < ApplicationController

def index
	  @users = User.all
	end

	def new
		@user = User.new
	end

	def edit
  end

	def create
		@user = User.new(users_params)
		if @user.save == false
			flash[:alert] = 'Error creating account: '
			@errors = @user.errors
			render "new", alert: 'Error creating account: ' 
		else
			@user.save
			redirect_to @user, notice: 'Account created. Please log in now.'
		end
	end

	def show
		@user = User.find(params[:id])
		gets user_path
	end

	 def update
	 	@user = User.find(params[:id])
      if @user.update(users_params)
      	@user.save
      	redirect_to user_path, notice: "Account is updated successfully."
      else
        render 'edit'
      end
    end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Account is deleted"
		redirect_to statuses_path
	end


	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
