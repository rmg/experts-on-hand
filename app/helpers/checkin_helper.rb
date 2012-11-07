module CheckinHelper
  def checkin_badge(checkin)
    delta = distance_of_time_in_words Time.now, checkin.ending_at
    "#{checkin.user.fullname} (#{delta})"
  end
end
