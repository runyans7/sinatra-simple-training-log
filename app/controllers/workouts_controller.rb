class WorkoutsController < ApplicationController

  get '/workouts/new' do
    erb :'workouts/new'
  end 

  post '/workouts/new' do
    @workout = Workout.new
    @workout.time_in_seconds = sum_seconds(params[:hours].to_i, params[:minutes].to_i, params[:seconds].to_i)
    @workout.distance = params[:distance]
    @workout.workout_type = params[:workout_type]
    @workout.user = current_user
    @workout.save
    binding.pry
  end

  helpers do

    def hours_to_seconds(hours)
      hours * 3600
    end

    def minutes_to_seconds(minutes)
      minutes * 60
    end

    def sum_seconds(hours, minutes, seconds)
      hours_to_seconds(hours) + minutes_to_seconds(minutes) + seconds
    end
  end
end