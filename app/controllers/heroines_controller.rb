class HeroinesController < ApplicationController

  def search
    query = params[:q].split.join
    powers = Power.all.map do |power|
      power.name.split.join
    end
    if powers.include?(query)
      found_power = Power.find_by(name: params[:q])
      redirect_to power_path(found_power)
    else
      @heroines = Heroine.all
      flash[:errors] = "That power does not exist."
      render :index
    end
  end

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
