class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = login(login_params[:email], login_params[:password])
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
    params.require(:session).permit(:email, :password)
  end

end
