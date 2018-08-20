class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    @query = params[:q]
    @heroines = Heroine.all.select do |heroine|
      heroine.power.name.downcase.include?(@query.downcase)
    end
    render :index
  end

  def show
    set_heroine
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new heroine_params

    if @heroine.save
      redirect_to heroine_path @heroine
    else
      redirect_to new_heroine_path
    end
  end

  private
    def set_heroine
      @heroine = Heroine.find params[:id]
    end

    def heroine_params
      params.require(:heroine).permit(:name,:super_name,:power_id)
    end
end
