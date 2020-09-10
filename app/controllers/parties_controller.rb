class PartiesController < ApplicationController
  def index
    @parties = Party.all.order(:party_start)
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    
    if @party.save
      flash[:success] = "現場を登録しました"
      redirect_to parties_path
    else
      flash[:danger] = "現場の登録に失敗しました"
      render :new
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    flash[:success] = "現場を削除しました"
    redirect_to parties_url
  end
  
  private
  
  def party_params
    params.require(:party).permit(:party_start, :station)
  end
end
