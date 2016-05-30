class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = @user.topics.find_or_create_by(title: params[:subject])
    @url = params["body-plain"]
    @bookmark = @topic.bookmarks.create(url: @url)
    head 200
  end
end
