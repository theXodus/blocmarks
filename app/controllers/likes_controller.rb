class LikesController < ApplicationController
  before_action :find_bookmark, except: [:o]

  def index
    @likes = current_user.likes.all
  end

  def create
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Liked!"
      redirect_to [@bookmark.topic,@bookmark]
    else
      flash[:alert] = "Unable to like. Please try again."
      redirect_to [@bookmark.topic,@bookmark]
    end
  end

  def destroy
    like = @bookmark.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to [@bookmark.topic,@bookmark]
    else
      flash[:alert] = "Unable to unlike. Please try again."
      redirect_to [@bookmark.topic,@bookmark]
    end
  end

  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

end