require 'spec_helper'

describe CheckinController do

  describe "GET 'index'" do
    it "returns http success" do
      checkins = FactoryGirl.create_list(:current_checkin, 5)
      get 'index'
      assigns(:current).should =~ checkins
      response.should be_success
    end
  end

end
