
class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.first
		binding.pry
	end

	def new
		@user = User.new	
		@user.build_user_app_role	
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def create

		@user = User.new(set_user_params)
		@user.randmonpwd
    if @user.save
    	
    	UserMailer.send_user_email(@user,request.url).deliver!
      redirect_to users_url, notice: 'User was successfully created.'
    else
      render :new 
    end		
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update(set_user_params)
      redirect_to users_url, notice: 'User was successfully updated.'
    else
      render :edit 
    end	
	end

	private
	def set_user_params
		params.require(:user).permit(:email, :name, :company_id, :language_id, :timezone, :notifications, 
			:signature, :password, :password_confirmation, :profile_pic, user_app_role_attributes: [:user_id,:role_name,:app_id])
	end
end
