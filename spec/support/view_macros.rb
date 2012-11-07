module ViewMacros
  def as_user
    before(:each) do
      controller.stub(:user_signed_in?) { true }
      controller.stub(:current_user) { FactoryGirl.build(:user) }
    end
  end
  def as_public
    before(:each) do
      controller.stub(:user_signed_in?) { false }
      controller.stub(:current_user) { nil }
    end
  end
end