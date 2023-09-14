class SpasController < ApplicationController
  before_action :require_login, only: %i[bookmarks]

  def index
    if params[:tag_name]
      @q = Spa.tagged_with("#{params[:tag_name]}").ransack(params[:q])
    else
      @q = Spa.ransack(params[:q])
    end
    spa_times_search = @q.result.ransack(closing_time_gteq: @q.opening_time_lteq)

    @spas = spa_times_search.result(distinct: true).page(params[:page]).order(id: :asc)
    
  end

  def show
    @spa = Spa.find(params[:id])

  end

  def bookmarks
    @q = current_user.bookmark_spas.ransack(params[:q])
    spa_times_search = @q.result.ransack(closing_time_gteq: @q.opening_time_lteq)

    @spas = spa_times_search.result(distinct: true).page(params[:page]).order(id: :asc)
  end

end
