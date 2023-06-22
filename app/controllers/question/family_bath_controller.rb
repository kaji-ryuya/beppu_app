class Question::FamilyBathController < ApplicationController
  before_action :set_session_location, only: %i[spa_quality spa_quality_post place place_post]
  before_action :choiced_location, only: %i[spa_quality place]
  
  def location; end

  def location_post
    if params[:location].present?
      session[:location] = params[:location]
      redirect_to question_family_bath_choice_path
    else
      redirect_to question_family_bath_location_path, danger: '選択してください'
    end
  end

  def choice
    session.delete(:spring_quality) if session[:spring_quality].present?
    session.delete(:place) if session[:place].present?
  end

  def spa_quality
    @spring_qualities = @selected_spas.distinct.pluck(:spring_quality)
  end

  def spa_quality_post
    if request.post? && params[:spring_quality].present?
      session[:spring_quality] = params[:spring_quality]
      redirect_to question_family_bath_answer_path
    else
      redirect_to question_family_bath_spa_quality_path, danger: '選択してください'
    end
  end

  def place
    @places = @selected_spas.distinct.pluck(:place)
  end

  def place_post
    if request.post? && params[:place].present?
      session[:place] = params[:place]
      redirect_to question_family_bath_answer_path
    else
      redirect_to question_family_bath_place_path, danger: '選択してください'
    end
  end

  def answer
    @location =session[:location]
    if session[:spring_quality].present?
      @spring_quality = session[:spring_quality]
      @spas = Spa.where(have_family_bath: 'TRUE').where(location: @location).where(spring_quality: @spring_quality).order('random()').limit(3)
    elsif session[:place].present?
      @place = session[:place]
      @spas = Spa.where(have_family_bath: 'TRUE').where(location: @location).where(place: @place).order('random()').limit(3)
    else
      @spas = Spa.where(have_family_bath: 'TRUE').where(location: @location).order('random()').limit(3)
    end
  end

  private

  def set_session_location
    @location = session[:location]
  end

  def choiced_location
    @selected_spas = Spa.where(have_family_bath: 'TRUE').where(location: @location)
  end
end