require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  valid_user_attrs = {email: "bob@example.com", password: 'somehash'}

  context "email address" do
    it "barfs without one" do
      missing_email = valid_user_attrs.reject {|k,v| k == :email}
      bad_user = User.new missing_email
      bad_user.should_not be_valid
      expect { User.create!(missing_email) }.to raise_error
    end
    it "sings with one" do
      user = User.new valid_user_attrs
      user.should be_valid
      expect { User.create!(valid_user_attrs) }.not_to raise_error
    end
  end

end
