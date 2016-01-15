class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/workouts'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    if any_params_blank?
      erb :'users/new'
    else
      @user = User.create(params)
      session[:user_id] = @user.id  
      redirect '/workouts'
    end
  end
end