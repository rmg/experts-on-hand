class CheckinController < ApplicationController
  def index
    @current = Checkin.current
  end
end
