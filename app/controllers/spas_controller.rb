class SpasController < ApplicationController
  before_action :set_spa, only: %i[ show ]
  before_action :require_login, only: %i[bookmarks]

  # GET /spas or /spas.json
  def index
    @q = Spa.ransack(params[:q])
    @spas = @q.result(distinct: true).page(params[:page]).order(id: :asc)
  end

  # GET /spas/1 or /spas/1.json
  def show; end

  def bookmarks
    @q = current_user.bookmark_spas.ransack(params[:q])
    @spas = @q.result(distinct: true).page(params[:page]).order(created_at: :asc)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_spa
    @spa = Spa.find(params[:id])
  end
end
