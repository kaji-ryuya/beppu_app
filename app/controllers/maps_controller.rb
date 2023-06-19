class MapsController < ApplicationController
  def map
    @q = Spa.ransack(params[:q])
    @spas = @q.result(distinct: true)
  end
end
