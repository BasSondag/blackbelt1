class SessionsController < ApplicationController

	def create
		puts params[:email]
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/brigth_ideas"
		else 
			flash[:errors] = ['Invalid password or email']	
			redirect_to "/users"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/users'
	end

end
