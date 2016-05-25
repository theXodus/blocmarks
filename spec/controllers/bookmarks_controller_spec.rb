require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  let(:topic) {FactoryGirl.create(:topic)}
  let(:bookmark) {FactoryGirl.create(:bookmark, topic: topic)}

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

end
