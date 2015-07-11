class VotesController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    @poll.votes.create(vote_params)
    redirect_to polls_path, notice: I18n.t(:success, scope: :messages)
  end

  private
    def vote_params
      params.require(:vote).permit(:answer)
    end

end
