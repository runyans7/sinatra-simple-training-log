class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    if logged_in?
      if any_params_blank?
        erb :'users/new'
      else
        @user = User.create(params)
        session[:user_id] = @user.id  
        redirect '/'
      end
    else
      redirect :'/'
    end
  end
end