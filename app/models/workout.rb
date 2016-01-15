class Workout < ActiveRecord::Base
  belongs_to :user

  def remaining_seconds(seconds)
    hours = seconds_to_hours(seconds)
    remaining_seconds = seconds - (3600 * hours)
    minutes = seconds_to_minutes(remaining_seconds)  
    remaining_seconds -= (minutes * 60)
    remaining_seconds
  end

  def remaining_minutes(seconds)
    hours = seconds_to_hours(seconds)
    remaining_seconds = seconds - (3600 * hours)
    seconds_to_minutes(remaining_seconds)
  end

  def seconds_to_hours(seconds)
    seconds / 3600
  end

  def seconds_to_minutes(seconds)
    seconds / 60
  end
end