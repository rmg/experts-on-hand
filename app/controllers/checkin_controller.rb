class CheckinController < ApplicationController
  def index
    @current = Checkin.current
    @today = Checkin.later_today
  end
end
