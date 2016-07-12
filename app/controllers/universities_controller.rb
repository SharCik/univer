class UniversitiesController < ApplicationController

  def universities_list
    mag = params[:magistracy] if params[:magistracy].present?
    och = params[:ochno] if params[:ochno].present?

    @city = City.all
    @univers = @univers.city(params[:cities]) if params[:cities].present?
    @univers = @univers.ochno(och["ochno"]) if params[:ochno].present?
    @univers = @univers.zaochno(params[:zaochno]) if params[:zaochno].present?
    @univers = @univers.magistracy(mag["magistracy"]) if params[:magistracy].present?
    

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
