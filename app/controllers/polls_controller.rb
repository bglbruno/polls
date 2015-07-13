class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @polls = Poll.all
    @poll = Poll.new
  end

  def show
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.save
    respond_with @poll
  end

  def update
    @poll.update(poll_params)
    respond_with @poll
  end

  def destroy
    @poll.destroy
    respond_to nil, location: polls_url
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description)
    end
end
