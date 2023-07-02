class BookmarksController < ApplicationController
  before_action :require_login

  def create
    @spa = Spa.find(params[:spa_id])
    current_user.bookmark(@spa)
  
    render turbo_stream: turbo_stream.replace(
      'bookmark-button',
      partial: 'spas/bookmark_button',
      locals: { spa: @spa },
    )
  end
  
  def destroy
    @spa = Spa.find(params[:id])
    current_user.unbookmark(@spa)
  
    render turbo_stream: turbo_stream.replace(
      'bookmark-button',
      partial: 'spas/bookmark_button',
      locals: { spa: @spa },
    )
  end
end
