class WorkoutTypesController < ApplicationController
  get '/workout_types/new' do
    if logged_in?
      erb :'workout_types/new'
    else
      redirect '/login'
    end
  end

  post '/workout_types/new' do
    if params[:workout_type] != ""
      @workout_type = WorkoutType.create(workout_type: params[:workout_type])
      redirect '/workouts'
    else
      redirect '/workout_types/new'
    end
  end
end
