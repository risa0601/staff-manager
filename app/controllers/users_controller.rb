class UsersController < ApplicationController
  def schedules
    @user = User.find(params[:id])
    @parties = Party.all
  end

  def skills
  end

  def shifts
    @user = User.find(params[:id])
    @shifts = @user.shifts
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_update_params)
      flash[:success] = "スタッフの情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "スタッフの情報を更新できませんでした"
      render :edit
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "スタッフの登録が完了しました"
      redirect_to root_path
    else
      flash[:danger] = "スタッフの登録に失敗しました"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "スタッフ登録を削除しました"
    redirect_to users_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_no, :password, :password_confirmation)
  end
  
  def user_update_params
    params.require(:user).permit(:name, :adress, :phone, :trip, :party_type, :position, :memo)
  end
end
