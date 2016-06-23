require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #e" do
    it "returns http success" do
      get :e
      expect(response).to have_http_status(:success)
    end
  end

end
