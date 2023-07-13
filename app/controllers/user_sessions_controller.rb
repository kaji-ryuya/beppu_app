class UserSessionsController < ApplicationController
  def new; end

  def create
    if login(params[:email], params[:password])
      return redirect_back_or_to root_path, success: 'ログインしました。'
    end
    user = User.find_by(email: params[:email])
    flash.now[:danger] = if user && user.login_locked?
                           'ご利用のアカウントはロックされています。時間をおいて再度ログインしてください。'
                         else
                           'ログインに失敗しました。'
                         end
    render :new
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました。'
  end
end
