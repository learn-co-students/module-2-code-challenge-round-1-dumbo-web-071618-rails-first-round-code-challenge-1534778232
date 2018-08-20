class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
  end

  def create

    @power = Power.create(power_params)
    redirect_to heroine_path(@power)
  end

  def show
    @power = Power.find(params[:id])
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
