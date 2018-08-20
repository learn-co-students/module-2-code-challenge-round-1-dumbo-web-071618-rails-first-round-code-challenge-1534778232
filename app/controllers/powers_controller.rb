class PowersController < ApplicationController
  #before_action :set_power, only: [:show, :edit, :update, :destroy]
  
  def index
    @powers = Power.all
  end

  def show 
  @power = Power.find(params[:id])
  end 


  def new 
   @power = Power.new(power_params)
  end 

  
  
  

  def edit 
    @power = Power.find(params[:id])
  end 

  def create 
    @power = Power.new(power_params) 
    if @power.save
      redirect_to power_page

    else 
      render :new
    end 
  end 

  def update 
    @power.update(power_params)
    if @power.save
      redirect_to power_page

    else 
      render :update
    end 
  end 


 private 

  def set_power	
    @power = Power.find(params[:id])	
  end	

  def power_params 
    params.require(:power).permit(:name,:description)
  end 

end
