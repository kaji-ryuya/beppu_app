class SpasController < ApplicationController
  before_action :set_spa, only: %i[ show ]

  # GET /spas or /spas.json
  def index
    @q = Spa.ransack(params[:q])
    @spas = @q.result(distinct: true).page(params[:page]).order(id: :asc)
  end

  # GET /spas/1 or /spas/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spa
      @spa = Spa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spa_params
      params.require(:spa).permit(:name)
    end
end
