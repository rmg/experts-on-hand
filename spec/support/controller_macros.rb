module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm!
      sign_in user
    end
  end
  def logout_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_out :user
    end
  end
end