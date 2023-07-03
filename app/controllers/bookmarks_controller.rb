class BookmarksController < ApplicationController
  before_action :require_login

  def create
    spa = Spa.find(params[:spa_id])
    current_user.bookmark(spa)
  
    render turbo_stream: turbo_stream.replace(
      "bookmark-button-#{spa.id}",
      partial: 'spas/bookmark_button',
      locals: { spa: spa },
    )
  end
  
  def destroy
    spa = current_user.bookmarks.find_by(spa_id: params[:id]).spa
    current_user.unbookmark(spa)
  
    render turbo_stream: turbo_stream.replace(
      "bookmark-button-#{spa.id}",
      partial: 'spas/bookmark_button',
      locals: { spa: spa },
    )
  end
end
