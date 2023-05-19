class SpasController < ApplicationController
  before_action :set_spa, only: %i[ show edit update destroy ]

  # GET /spas or /spas.json
  def index
    @spas = Spa.all.page(params[:page]).order(id: :desc)
  end

  # GET /spas/1 or /spas/1.json
  def show
  end

  # GET /spas/new
  def new
    @spa = Spa.new
  end

  # GET /spas/1/edit
  def edit
  end

  # POST /spas or /spas.json
  def create
    @spa = Spa.new(spa_params)

    respond_to do |format|
      if @spa.save
        format.html { redirect_to spa_url(@spa), notice: "Spa was successfully created." }
        format.json { render :show, status: :created, location: @spa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spas/1 or /spas/1.json
  def update
    respond_to do |format|
      if @spa.update(spa_params)
        format.html { redirect_to spa_url(@spa), notice: "Spa was successfully updated." }
        format.json { render :show, status: :ok, location: @spa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spas/1 or /spas/1.json
  def destroy
    @spa.destroy

    respond_to do |format|
      format.html { redirect_to spas_url, notice: "Spa was successfully destroyed." }
      format.json { head :no_content }
    end
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
