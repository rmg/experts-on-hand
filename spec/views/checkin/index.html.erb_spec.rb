require 'spec_helper'

describe "checkin/index.html.erb" do
  pending "add some examples to (or delete) #{__FILE__}"
  it "displays some representation of each current checkin" do
    assign(:current, FactoryGirl.build_list(:checkin, 5))
    render
    rendered.should match_select('.checkin', 5)
  end
end
