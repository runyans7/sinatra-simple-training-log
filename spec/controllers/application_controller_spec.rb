require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it "should load the homepage" do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Simple Logger")
    end
  end

end
