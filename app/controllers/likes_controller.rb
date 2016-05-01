class LikesController < ApplicationController

	def create
		Like.create(user: current_user, brigth_idea:BrigthIdea.find(params[:id]))
  	redirect_to :back
  end
end
