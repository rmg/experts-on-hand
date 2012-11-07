require 'spec_helper'

describe CheckinController do

  context "when not logged in" do
    logout_user

    describe "GET 'index'" do
      it "renders the login page" do
        get 'index'
        response.should redirect_to(new_user_session_path)
      end
    end
    describe "POST 'create'" do
      it "renders the login page" do
        post 'create'
        response.should redirect_to(new_user_session_path)
      end
    end
  end

  context "when logged in" do
    login_user

    describe "GET 'index'" do
      it "returns http success" do
        checkins = FactoryGirl.create_list(:current_checkin, 5)
        get 'index'
        assigns(:current).should =~ checkins
        response.should be_success
      end
    end

    describe "POST 'create'" do
      it "should let a user post a checkin" do

      end
    end
  end
end
