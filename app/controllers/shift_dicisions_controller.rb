class ShiftDicisionsController < ApplicationController  
  def create
    @user = User.find(params[:party_id])
    @user.work(party)
    flash[:success] = "現場に手配しました"
    redirect_to user
  end

  def destroy
    @user = User.find(params[:party_id])
    @user.unwork(party)
    flash[:success] = "現場から削除しました"
    redirect_to user
  end
end
