class UsersController < ApplicationController
  

  def skills
    @user = User.find(params[:id])
    @skills = @user.skills
  end

  def shifts
    @user = User.find(params[:id])
    @shifts = @user.shifts.order(:date)
  end
  
  def index
    @users = User.all
    if params[:staff_no].present?
      @users = @user.get_by_staff_no params[:staff_no]
    end
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
  end
  
  def show
    @user = User.find(params[:id])
    @parties = @user.parties.order(:party_start)
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
  
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:success] = "メールアドレス認証が完了しました"
      redirect_to login_url
    else
      not_authenticated
    end
  end

  def skill
    @user = User.find(params[:id])
    @skills = Skill.all
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "スタッフ登録を削除しました"
    redirect_to users_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_no, :email, :password, :password_confirmation)
  end
  
  def user_update_params
    params.require(:user).permit(:name, :adress, :phone, :email, :trip, :party_type, :position, :memo)
  end
end
