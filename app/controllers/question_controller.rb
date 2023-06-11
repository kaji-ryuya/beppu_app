class QuestionController < ApplicationController

  def question
    session.delete(:spring_quality) if session[:spring_quality].present?
    session.delete(:charactor) if session[:charactor].present?
  end

  def answer
    @spring_quality = session[:spring_quality]
    @have_family_bath = session[:have_family_bath]
    @charactor = session[:charactor]
    @spas = Spa.where(spring_quality: @spring_quality).where(have_family_bath: @have_family_bath).where(charactor: @charactor).order('random()').limit(3)

  end
end
