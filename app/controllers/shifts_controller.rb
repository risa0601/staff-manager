class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
  end

  def create
    @shift = current_user.shifts.build(shift_params)
    
    if @shift.save
      flash[:success] = "シフト希望を提出しました"
      redirect_to shifts_user_path(current_user)
    else
      flash[:danger] = "シフト希望を提出できませんでした"
      render :new
    end
  end
  
  private
  
  def shift_params
    params.require(:shift).permit(:date, :category, :content)
  end

end
