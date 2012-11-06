class Checkin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :ending_at, :starting_at

  scope :current, ->() {
    where('starting_at < NOW() AND ending_at > NOW()')
  }

  scope :later_today, ->() {
    where('starting_at < ?', 1.day)
  }
end
