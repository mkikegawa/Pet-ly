class PetsController < ApplicationController
  def index
    @pets = Pets.all 
  end  

  def show
    @pet = Pet.find(params[:id]) 
  end

  
end
