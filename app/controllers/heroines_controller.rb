class HeroinesController < ApplicationController
  def index
    if params[:power]
      @heroine = Heroine.where('power LIKE ?', "%#{params[:power]}%")
    else
      @heroine = Heroine.all
    end
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
      redirect_to new_heroine_path(@heroine)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:power, :name, :super_name, :power_id)
  end
end
