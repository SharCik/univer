class UniversitiesController < ApplicationController

  def index
    @univers = University.paginate(:per_page => 5, :page => params[:page])
    @city = City.all
    @univers = @univers.ochno(params[:ochno]) if params[:ochno].present?
    @univers = @univers.zaochno(params[:zaochno]) if params[:zaochno].present?
    @univers = @univers.magistracy(params[:magistracy]) if params[:magistracy].present?
    @univers = @univers.preparatory_department(params[:preparatory_department]) if params[:preparatory_department].present?
    @univers = @univers.hostel(params[:hostel]) if params[:hostel].present? 
    
      respond_to do |format|
        format.js 
        format.html 
      end   
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

  private

  def univer_params
    params.require(:university).permit(:name, :short_name, :description, :image, :initial_cost)
  end 

end
