class UsersController < ApplicationController

  def show
    @user_bookmarks = current_user.bookmarks.all
    @liked_bookmarks = current_user.liked_bookmarks
  end

end
