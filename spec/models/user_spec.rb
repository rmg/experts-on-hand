require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:minimum_attrs) {
    {
      email: "bob@example.com",
      password: 'somehash'
    }
  }

  context "email address" do
    let(:missing_email) { minimum_attrs.reject {|k,v| k == :email} }

    it "isn't a valid user without one" do
      User.new(missing_email).should_not be_valid
    end
    it "barfs without one" do
      expect { User.create!(missing_email) }.to raise_error
    end

    it "sings with one" do
      User.new(minimum_attrs).should be_valid
    end
    it "doesn't barf when you get it right" do
      expect { User.create!(minimum_attrs) }.not_to raise_error
    end
  end

  context "fullname" do
    let(:fullname) { "Bob T. Builder" }
    let(:fullname_attrs) {
      minimum_attrs.update(fullname: fullname)
    }

    it "can be given a fullname at creation" do
      User.new(fullname_attrs).fullname.should == fullname
    end

    it "persists its fullname" do
      first = User.create(fullname_attrs)
      second = User.find(first.id)
      second.fullname.should == fullname
    end
  end
end
