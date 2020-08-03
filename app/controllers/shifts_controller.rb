class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    
    if @shift.save
      flash[:success] = "シフト希望を提出しました"
      redirect_to shifts_user_path(current_user)
    else
      flash[:danger] = "シフト希望を提出できませんでした"
      render :new
    end
  end

end
