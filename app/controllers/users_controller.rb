class UsersController < ApplicationController
  def schedules
    @user = User.find(params[:id])
    @parties = Party.all
  end

  def skills
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

  def shifts
    @user = User.find(params[:id])
    @shifts = @user.shifts
    
    # @shifts = current_user.shifts
  end

  def destroy
  end
  
  def change_pass
    user = current_user
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.valid?
      user.save
      flash[:success] = "パスワードを更新しました"
    else
      flash[:danger] = "パスワードを更新できませんでした"
      render :change_pass
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_no, :password, :password_confirmation)
  end
  
end
