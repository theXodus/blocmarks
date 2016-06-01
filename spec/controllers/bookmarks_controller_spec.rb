require 'rails_helper'
require 'support/controller_macros.rb'

RSpec.describe BookmarksController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:topic) {FactoryGirl.create(:topic)}
  let(:bookmark) {FactoryGirl.create(:bookmark, topic: topic, user: user)}

  describe "#show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "render the #show view" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to render_template :show
    end
  end

  describe "#new" do
    it "returns http success" do
      get :new, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: topic.id, id: bookmark.id
      expect(response).to render_template :new
    end

    it "instantiates @bookmark" do
      get :new, topic_id: topic.id, id: bookmark.id
      expect(assigns(:bookmark)).not_to be_nil
    end
  end

  describe "#edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    it "should only allow update for bookmark user" do
      user2 = FactoryGirl.create :user
      sign_in user2
      expect(post :update, topic_id: topic.id, id: bookmark.id).to have_http_status(302)
    end
  end

  describe "#destroy" do
    it "should only allow delete for bookmark user" do
      bookmark_count = Bookmark.count
      user2 = FactoryGirl.create :user
      sign_in user2
      expect(delete :destroy, topic_id: topic.id, id: bookmark.id).to have_http_status(302)
    end
  end

end
