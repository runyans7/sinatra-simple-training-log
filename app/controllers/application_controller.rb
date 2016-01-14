require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'simple_logger_session_secret'
  end

  get '/' do
    erb :'home'
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    
    def any_params_blank?
      params.values.any? { |x| x == "" } 
    end
  end
end