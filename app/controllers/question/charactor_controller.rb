class Question::CharactorController < ApplicationController
  before_action :require_question, only: %i[answer]
  before_action :require_spa_quality_question, only: %i[spa_quality]
  
  def charactor; end

  def charactor_post
    if request.post? && params[:charactor].present?
      session[:charactor] = params[:charactor]
      redirect_to question_charactor_spa_quality_path
    else
      redirect_to question_charactor_charactor_path, danger: '選択してください'
    end
  end

  def spa_quality
    charactor = session[:charactor]
    selected_spas = Spa.where(charactor: charactor)
    @spring_qualities = selected_spas.distinct.pluck(:spring_quality)
  end

  def spa_quality_post
    if request.post? && params[:spring_quality].present?
      session[:spring_quality] = params[:spring_quality]
      redirect_to question_charactor_answer_path
    else
      redirect_to question_charactor_spa_quality_path, danger: '選択してください'
    end
  end

  def answer
    @spring_quality = session[:spring_quality]
    @charactor = session[:charactor]
    @spas = Spa.where(spring_quality: @spring_quality).where(charactor: @charactor).order('random()').limit(3)
  end

  private

  def require_question
    if !session[:spring_quality] && !session[:charactor]
      redirect_to question_question_path
    end
  end

  def require_spa_quality_question
    if !session[:charactor]
      redirect_to question_question_path
    end
  end
end