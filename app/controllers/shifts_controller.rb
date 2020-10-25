class ShiftsController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @shifts = @user.shifts.order(:date)
  end
  
  def new
    @shifts = ShiftsCollection.new
  end
  
  def create
    @shifts = ShiftsCollection.new(shifts_params)
    if @shifts.save
      flash[:success] = "シフト希望を提出しました"
      redirect_to shift_path(current_user)
    else
      flash[:danger] = "シフト希望を提出できませんでした"
      render :new
    end
  end

  
  private
  
  def shifts_params
    params.require(:shifts)
  end

end
