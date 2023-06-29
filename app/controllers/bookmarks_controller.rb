class BookmarksController < ApplicationController
  before_action :require_login

  def create
    spa = Spa.find(params[:id])
    current_user.bookmark(spa)
    
  end

  def destroy
    spa = Spa.find(params[:id])
    current_user.unbookmark(spa)
  end
end
