require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'simple_logger_session_secret'
  end

  get '/' do
    if logged_in?
      redirect '/workouts'
    else
      erb :'home'
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def any_params_blank?
      params.values.any? { |x| x == "" }
    end
  end
end
