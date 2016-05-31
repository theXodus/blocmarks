require 'rails_helper'

RSpec.describe IncomingController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}

  before(:each) do
    @email = { "sender" => user.email,
               "subject" => "Topic",
               "stripped-text" => "http://www.bloc.io" }
  end


  describe "GET #create" do
    it "create bookmark from email params" do
      bookmark_count = Bookmark.count
      post "create", @email
      expect(Bookmark.count).to eq(bookmark_count + 1)
    end

    it "should not create a bookmark if user not found" do
      @email = { "sender" => "email@example.com" }
      post "create", @email
      expect(response).to have_http_status(:unauthorized)
    end

    it "bookmark should belong to topic" do
      post "create", @email
      @topic = Topic.last
      @bookmark = Bookmark.last
      expect(@topic).to eq(@bookmark.topic)
    end

    it "should NOT create a new topic if topic exists" do
      @email = { "subject" => "MyString"}
      topic_count = Topic.count
      post "create", @email
      expect(Topic.count).to eq(topic_count)
    end
  end

end
