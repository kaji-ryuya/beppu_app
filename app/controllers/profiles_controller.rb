class ProfilesController < ApplicationController
  before_action :set_user
  before_action :require_login

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, success: 'プロフィールを変更しました。'
    else
      flash.now[danger] = 'プロフィールの変更に失敗しました。'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
