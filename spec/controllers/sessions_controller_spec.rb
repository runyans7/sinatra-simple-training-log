require 'spec_helper'
require "pry"

describe SessionsController do

  describe "Login" do
    it "should load the login page" do
      get '/login'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Log In")
    end

    it "should redirect to the workout index on successfull login" do
      User.create(username: 'johndoe', email: 'john@doe.com', password: 'password')

      params = {username: 'johndoe', password: 'password'}

      post '/login', params
      expect(last_response.status).to eq(302)
    end
  end

end
