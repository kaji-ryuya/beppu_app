class QuestionController < ApplicationController

  def question
    @spas = Spa.all
  end

  def search
    spa_quality_value = params[:spa_quality]
    have_family_bath_value = params[:have_family_bath]
    place_value = params[:place]

    @results = Spa.where(spa_quality: spa_quality_value, have_family_bath: have_family_bath_value, place: place_value).order("RANDOM()").limit(3)
  end

  def index
  end
end
