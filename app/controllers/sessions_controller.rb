class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :'sessions/new'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/workouts'
    else
      erb :'sessions/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end