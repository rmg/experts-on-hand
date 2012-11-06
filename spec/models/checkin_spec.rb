require 'spec_helper'

describe Checkin do
  context "scopes" do
    it "knows about current checkins" do
      checkins = FactoryGirl.create_list(:checkin, 5,
                                         starting_at: 5.minutes.ago,
                                         ending_at: (Time.now + 4.minutes))
      Checkin.current =~ checkins
    end
  end
end
