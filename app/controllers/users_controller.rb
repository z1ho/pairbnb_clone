class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])  
  end

  def profile
  	@user = current_user
  end

  def edit
  	@user = User.find(params[:id])  
  end


  def update
	@user = User.find(params[:id]) 
	# @user.update_attributes(user_params_update)
	@user.update(user_params_update)

	if @user.save
		redirect_to my_profile_path
		flash[:success] = "Successfully updated details!"
		else
			# flash[:danger] = "Error, details not updated"
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :gender, :birthday, :subscribe, :encrypted_password, :avatar, :about, :reservations)
	end

	def user_params_update
		params.require(:user).permit(:first_name, :last_name, :email, :gender, :birthday, :subscribe, :about).merge(encrypted_password: @user.encrypted_password)
	end

	def check_user
		unless current_user == User.find(params[:id])
			flash[:danger] = "Error, please try again"
			redirect_to '/'
		end
	end
	
end
