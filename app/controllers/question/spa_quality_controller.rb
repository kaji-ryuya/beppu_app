class Question::SpaQualityController < ApplicationController
  before_action :require_question, only: %i[answer]
  before_action :require_charactor_question, only: %i[:charactor]
  
  def spa_quality; end

  def spa_quality_post
    if params[:spring_quality].present?
      session[:spring_quality] = params[:spring_quality]
      redirect_to question_spa_quality_charactor_path
    else
      # redirectが必要というエラーが出た
      redirect_to question_spa_quality_spa_quality_path, danger: '選択してください'
    end
  end

  def charactor
    spring_quality = session[:spring_quality]
    selected_spas = Spa.where(spring_quality: spring_quality)
    @charactors = selected_spas.distinct.pluck(:charactor)
  end

  def charactor_post
    if params[:charactor].present?
      session[:charactor] = params[:charactor]
      redirect_to question_spa_quality_answer_path
    else
      redirect_to question_spa_quality_charactor_path, danger: '選択してください'
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

  def require_charactor_question
    if !session[:spring_quality]
      redirect_to question_question_path
    end
  end
end
