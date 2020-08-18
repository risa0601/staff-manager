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
    
    # @shifts = current_user.shifts
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    #編集しようとしているのが管理者であるかのチェック要
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
  end
  
  def pass_edit
    @user = User.find(params[:id])
  end
  
  def pass_update
    @user = User.find(params[:id])
    
    if current_user == @user
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
        if @user.valid?
          @user.save
          flash[:success] = "パスワードを更新しました"
        else
          flash[:danger] = "パスワードを更新できませんでした"
          render :change_pass
        end
    else
      redirect_to root_url
    end    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_no, :password, :password_confirmation)
  end
  
end
