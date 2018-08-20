class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params[:search]
      @heroines.select {|heroine| heroine.power.name == params[:search]}
    else
      @heroines = Heroine.all.order("created_at DESC")
    end
  end

  def show
    @heroine =  Heroine.find(params[:id])
  end

  # def search
  #   @heroines = Heroine.all
  #   power = Power.find_by(name: params[:q])
  #   @heroines.select do |heroine|
  #     heroine.power == power
  #   end
  # end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      flash[:notice] = "Action performed successfully"

      redirect_to heroine_path(@heroine)
    else

      redirect_to new_heroine_path(@heroine)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit!
  end
end
