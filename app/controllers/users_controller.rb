class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

	def create
		@user = User.new user_params
		if @user.save
			flash[:success] = "User created successfully"
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end
end
