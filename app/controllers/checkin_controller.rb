class CheckinController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current = Checkin.current
  end

  def create
    @checkin = Checkin.new
    @checkin.starting_at = params.fetch :starting_at, Time.now
    @checkin.ending_at = params.fetch :ending_at, Time.now
    @checkin.user = current_user
    unless @checkin.save
      flash[:error] = "Sorry, something went wrong when checking you in"
    end
    render :index
  end
end
