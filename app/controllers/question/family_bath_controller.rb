class Question::FamilyBathController < ApplicationController

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


end