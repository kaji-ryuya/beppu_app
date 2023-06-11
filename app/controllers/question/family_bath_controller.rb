class Question::FamilyBathController < ApplicationController
  before_action :set_session_location, only: %i[spa_quality spa_quality_post place place_post]
  before_action :choiced_location, only: %i[spa_quality place]
  
  def location; end

  def location_post
    if request.post? && params[:location].present?
      session[:location] = params[:location]
      redirect_to question_family_bath_choice_path
    else
      render :location
    end
  end

  def choice; end

  def spa_quality
    @spring_qualities = selected_spas.dictinct.pluck(:spring_quality)
  end

  def spa_quality_post
    if request.post? && params[:spring_quality].present?
      session[:spring_quality] = params[:spring_quality]
      redirect_to question_family_bath_answer_path
    else
      render :spa_quality
    end
  end

  def place
    @places = selected_spas.dictinct.pluck(:place)
  end

  def place_post
    if request.post? && params[:place].present?
      session[:place] = params[:place]
      redirect_to question_family_bath_answer_path
    else
      render :place
    end
  end

  def answer
    
  end

  private

  def set_session_location
    location = session[:location]
  end

  def choiced_location
    selected_spas = Spa.where(have_family_bath: TRUE).where(location:location)
  end
end