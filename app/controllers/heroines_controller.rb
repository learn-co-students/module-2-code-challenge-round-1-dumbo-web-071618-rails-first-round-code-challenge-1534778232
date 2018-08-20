class HeroinesController < ApplicationController
  #before_action :set_heroine, only: [:show, :edit, :update, :destroy]
  
  def index
    @heroines = Heroine.all
  end

  def show 
  @heroine = Heroine.find(params[:id])
  end 


  def new 
   @heroine = Heroine.new(heroine_params)
  end 

  def edit 
    @heroine = Heroine.find(params[:id])
  end 

  def create 
    @heroine = Heroine.create(heroine_params) 
    if @heroine.save
      redirect_to heroine_page

    else 
      render :new
    end 
    
  end 

  def update 
    @heroine.update(heroine_params)
  end 


  private 

  def set_heroine	
    @heroine = Heroine.find(params[:id])	
  end	

  def heroine_params 
    params.require(:heroine).permit(:name,:super_name)
  end 

end
