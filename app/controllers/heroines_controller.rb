class HeroinesController < ApplicationController
  def index
    @heroines = []
    @message = ""
    if params.key?(:q)
      @heroines = Heroine.all.select do |heroine|
        heroine.power.name == params[:q]
      end
      @message = "No heroines were found." if @heroines.empty?
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @message = ""
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @message = "Sorry! That name already exist. Please enter another name!"
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
