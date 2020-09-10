class ShiftDicisionsController < ApplicationController
  def create
    @user = User.find(params[:party_id])
    @user.have(party)
    flash[:success] = "現場に手配しました"
    redirect_to user
  end

  def destroy
    @user = User.find(params[:party_id])
    @user.unhave(party)
    flash[:success] = "現場から削除しました"
    redirect_to user
  end
end
