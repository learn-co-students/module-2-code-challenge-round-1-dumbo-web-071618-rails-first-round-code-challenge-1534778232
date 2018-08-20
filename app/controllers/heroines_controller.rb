class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    @power = Power.new
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    new_heroine = Heroine.new(heroine_params)

    if new_heroine.save
      redirect_to heroine_path(new_heroine)
    else
      render :new
    end
  end

  def search
    # byebug
    power = Power.where(power_params)
    @heroines = Heroine.find_by(power: power)

    if @heroines
      render :index
    else
      render :none
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def power_params
    params.require(:power).permit(:name)
  end
end
