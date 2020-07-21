class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  
  def new
  end

  def create
    @user = login(login_params[:staff_no], login_params[:password])
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
    redirect_to root_url
  end
  
  private
  
  def login_params
    params.require(:session).permit(:staff_no, :password)
  end

end
