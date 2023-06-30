class BookmarksController < ApplicationController
  before_action :require_login

  def create
    spa = Spa.find(params[:spa_id])
    current_user.bookmark(spa)
    redirect_back fallback_location: root_path, success: 'ブックマークしました。'
  end

  def destroy
    spa = Spa.find(params[:id])
    current_user.unbookmark(spa)
    redirect_back fallback_location: root_path, success: 'ブックマークを外しました。'
  end
end
