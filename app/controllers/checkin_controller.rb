class CheckinController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current = Checkin.current
  end
end
