require './config/environment'

class ApplicationController < Sinatra::Base

  get '/' do
    "Hello world"
  end
  
end