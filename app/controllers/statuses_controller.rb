class StatusesController < ApplicationController

	def new
		@status = Status.new
	end

	def create
			@status = Status.new(status_params)
		if @status.save == false
			flash[:alert] = 'Error creating status.'
			@errors = @status.errors
			render "new" 
		else
			@status.save
			redirect_to @status, notice: 'Status is created successfully.'
		end
	end

	def edit

	end

	def update
		@status = Status.find(params[:id])
      if @status.update(status_params)
      	@status.save
      	redirect_to status_path, notice: "Status is updated successfully."
      else
        render 'edit'
      end
	end

	def destroy
		@status = Status.find(params[:id])
		@status.destroy
		flash[:notice] = "Status is deleted."
		redirect_to statuses_path
	end

	 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:title, :content, :user_id)
    end
end