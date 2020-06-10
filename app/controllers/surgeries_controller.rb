class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def new
    @surgery = Surgery.new
  end

  def create
    @surgery = Surgery.new(sur_params)
    if @surgery.save
      flash[:success] = "New Surgery Scheduled!"
      redirect_to "/surgeries"
    else
      flash[:error] = @surgery.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def sur_params
    params.require(:surgery).permit(:title, :day_of_week, :operating_room_number)
  end

end
