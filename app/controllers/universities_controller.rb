class UniversitiesController < ApplicationController

  def index
    @univers = University.paginate(:per_page => 5, :page => params[:page]).order(rating: :desc)
    @city = City.all
    @univers = @univers.ochno(params[:ochno]) if params[:ochno].present?
    @univers = @univers.zaochno(params[:zaochno]) if params[:zaochno].present?
    @univers = @univers.magistracy(params[:magistracy]) if params[:magistracy].present?
    @univers = @univers.preparatory_department(params[:preparatory_department]) if params[:preparatory_department].present?
    @univers = @univers.hostel(params[:hostel]) if params[:hostel].present? 
    @univers = @univers.search(params[:search]) if params[:search].present?
    
      respond_to do |format|
        format.js 
        format.html 
      end   
  end


  def show
    
    @univer = University.find(params[:id])
    @city = City.find(@univer.city_id)
    @departaments = Departament.where(university_id: @univer.id)
  end


  private

  def univer_params
    params.require(:university).permit(:name, :short_name, :description, :image, :initial_cost)
  end 

end
