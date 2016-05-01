class BrigthIdeasController < ApplicationController
	def index
    @ideas = BrigthIdea.all
	end

  def show
    @idea = BrigthIdea.find(params[:id])

  end

	def create
		BrigthIdea.create(idea_params)
		redirect_to :back
	end

  def destroy
    idea = BrigthIdea.find(params[:id])
    idea.destroy if idea.user == current_user
    redirect_to :back
  end

	private
    def idea_params
      params.require(:idea).permit(:content, :user_id)
    end

end
