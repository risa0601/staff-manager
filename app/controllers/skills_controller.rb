class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
  
  def show
   @user = User.find(params[:id])
    @skills = @user.skills
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    
    if @skill.save
      flash[:success] = "スキルを登録しました"
      redirect_to skills_path
    else
      flash.now[:danger] = "スキルの登録に失敗しました"
      render :new
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:success] = "スキルを削除しました"
    redirect_to skills_url
  end
  
  private
  
  def skill_params
    params.require(:skill).permit(:skill_name)
  end
end
