class BookmarksController < ApplicationController

  before_action :find_topic
  before_action :find_bookmark, except: [:new, :create]

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark Saved!"
      redirect_to [@bookmark.topic,@bookmark]
    else
      flash[:alert] = "There was a problem saving your bookmark"
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      flash[:notice] = "Bookmark Updated!"
      redirect_to [@bookmark.topic,@bookmark]
    else
      flash[:alert] = "There was a problem updating your bookmark"
      render :edit
    end
  end

  def destroy
    if @bookmark.delete
      flash[:notice] = "Bookmark Deleted"
      redirect_to(@topic)
    else
      flash[:alert] = "There was a problem deleting your bookmark"
      render :topic
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_bookmark
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
