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
    @shifts = Shift.all
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_no, :password, :password_confirmation)
  end
  
end
