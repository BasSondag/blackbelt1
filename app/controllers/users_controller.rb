class UsersController < ApplicationController

	def index
	end 

  def show
    @user = User.find(params[:id])
  end

	def create
   user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/brigth_ideas"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
   def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
