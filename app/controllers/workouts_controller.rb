class WorkoutsController < ApplicationController

  get '/workouts/new' do
    if logged_in?
      erb :'workouts/new'
    else
      redirect '/login'
    end
  end

  post '/workouts/new' do
    if required_fields_filled?
      @workout = Workout.create(
        time_in_seconds: sum_seconds(params[:hours].to_i, params[:minutes].to_i, params[:seconds].to_i),
        distance: params[:distance],
        workout_type: params[:workout_type],
        user: current_user
      )
      redirect '/workouts'
    else
      redirect '/workouts/new'
    end
  end

  get '/workouts' do
    if logged_in?
      @workouts = Workout.where(user_id: current_user.id)
      erb :'workouts/index'
    else
      redirect '/login'
    end
  end

  get '/workouts/:id/edit' do
    @workout = Workout.find(params[:id])

    if @workout.user == current_user
      erb :'workouts/edit'
    else
      redirect '/workouts'
    end
  end

  post '/workouts/:id/edit' do
    @workout = Workout.find(params[:id])

    if @workout.user == current_user
      if required_fields_filled?
        @workout.update(
          time_in_seconds: sum_seconds(params[:hours].to_i, params[:minutes].to_i, params[:seconds].to_i),
          distance: params[:distance],
          workout_type: params[:workout_type],
          user: current_user
        )
        redirect '/workouts'
      else
        redirect "/workouts/#{@workout.id}/edit"
      end
    else
      redirect '/workouts'
    end
  end

  post '/workouts/:id/delete' do
    @workout = Workout.find(params[:id])

    if @workout.user == current_user
      @workout.destroy
      redirect '/workouts'
    else
      redirect 'workouts'
    end
  end

  helpers do

    def required_fields_filled?
      params[:distance] != "" && (params[:hours] != "" || params[:minutes] != "" || params[:seconds] != "")
    end

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
