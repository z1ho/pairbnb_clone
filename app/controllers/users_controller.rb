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
	@user.update(user_params)
	if @user.save
		redirect_to my_profile_path
		else
			flash[:warning] = "Error"
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :gender, :birthday, :subscribe, :email, :encrypted_password, :avatar, :about, :reservations)
	end

	def check_user
		unless current_user == User.find(params[:id])
			flash[:warning] = "Error"
			redirect_to '/'
		end
	end
	
end
