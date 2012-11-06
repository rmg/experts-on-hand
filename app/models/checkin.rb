class Checkin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :ending_at, :starting_at
end
