class HavingSkillsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.have(skill)
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    current_user.unhave(skill)
    redirect_to user
  end
end
