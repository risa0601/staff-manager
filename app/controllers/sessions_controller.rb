class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:starr_no], params[:password])
    if @user
      flash[:success] = "ログインしました"
      redirect_back_or_to(root_path)
    else
      flash[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end
end
