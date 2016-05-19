require 'rails_helper'
require 'support/controller_macros.rb'


RSpec.describe TopicsController, type: :controller do

  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      topic = FactoryGirl.create :topic, user: @user
      get :show, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "creates topic" do
      topic_params = FactoryGirl.attributes_for(:topic)
      expect { post :create, :topic => topic_params }.to change(Topic, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      topic = FactoryGirl.create :topic, user: @user
      get :edit, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

end
