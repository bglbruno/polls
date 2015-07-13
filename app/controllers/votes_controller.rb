class VotesController < ApplicationController
  respond_to :js, :html
  def create
    @poll = Poll.find(params[:poll_id])
    @poll.votes.create(vote_params)
    respond_with @poll do |format|
      format.js { render nothing: true }
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:answer)
    end

end
