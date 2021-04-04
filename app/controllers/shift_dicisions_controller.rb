class ShiftDicisionsController < ApplicationController  
  def create
    @user = User.find(params[:user_id])
    @party = Party.find(params[:party_id])
    @user.work(@party)
    flash[:success] = "現場に手配しました"
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:user_id])
    @party = Party.find(params[:party_id])
    @user.unwork(@party)
    flash[:success] = "現場から削除しました"
    redirect_to :back
  end
end
