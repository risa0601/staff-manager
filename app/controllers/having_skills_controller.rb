class HavingSkillsController < ApplicationController
  def create
    user = User.find(params[:skill_id])
    current_user.have(skill)
    flash[:success] = "スキルを登録しました"
    redirect_to user
  end

  def destroy
    user = User.find(params[:skill_id])
    current_user.unhave(skill)
    flash[:success] = "スキルを削除しました"
    redirect_to user
  end
end
