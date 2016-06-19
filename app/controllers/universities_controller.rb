class UniversitiesController < ApplicationController

  def index
    @univers = University.all
  end

  def new
    @univer =  University.new
  end

  def create
    @univer =  University.new(univer_params)

    if @univer.save!
      redirect_to root_path
    else
      redirect_to new_university_path
    end
  end

  def show
    @univer = University.find(params[:id])
    @city = City.find(@univer.city_id)
    @departaments = Departament.where(university_id: @univer.id)
    departament = Departament.find(1)
    @specialties = Specialty.where(departament_id: departament.id)
  end

  def edit
    @univer = University.find(params[:id])
  end

  def update
    @univer = University.find(params[:id])
      if @univer.update(univer_params)
        flash[:notice] = "University updated."
        redirect_to university_path
      else
        flash[:error] = "Could not update user."
        redirect_to edit_university_path
      end
  end

  def departament_specailties
    
  end

  private

  def univer_params
    params.require(:university).permit(:name, :short_name, :description, :image, :initial_cost)
  end 

end
