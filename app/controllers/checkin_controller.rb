class CheckinController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current = Checkin.current
    @old = Checkin.old
  end

  def create
    @checkin = Checkin.new
    @checkin.starting_at = Time.now
    @checkin.ending_at = @checkin.starting_at + 1.hour
    @checkin.user = current_user
    unless @checkin.save
      flash[:error] = "Sorry, something went wrong when checking you in"
    end
    redirect_to root_path
  end
end
