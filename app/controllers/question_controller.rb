class QuestionController < ApplicationController

  def question
    session.delete(:spring_quality) if session[:spring_quality].present?
    session.delete(:charactor) if session[:charactor].present?
    session.delete(:place) if session[:place].present?
    session.delete(:location) if session[:location].present?
  end
end
