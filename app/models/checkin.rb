class Checkin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :ending_at, :starting_at

  scope :current, ->() {
    where('starting_at < NOW() AND ending_at > NOW()')
  }
  scope :old, ->() {
    where('ending_at < NOW()')
  }
end
