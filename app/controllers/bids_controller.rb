class BidsController < ApplicationController

  def new
    @universities = University.all 
    @university  = University.find(params[:university]) if params[:university].present?
    @departament = Departament.find(params[:departament]) if params[:departament].present?
    @specialty   = Specialty.find(params[:specialty]) if params[:specialty].present?
    @magistracy  = Magistracy.find(params[:magistracy]) if params[:magistracy].present?
    @bid         = Bid.new
      
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create

    @bid =  Bid.new(bid_params)
    if params[:specialty].present?
      spec = Specialty.find(params[:specialty]) 
      departament = Departament.where(id: spec.departament_id).first
      @bid.specialty_id = params[:specialty]
      @bid.departament_id = departament.id
      university = University.where(id: departament.university_id).first
      @bid.university_id = university.id
      city = City.where(id: university.city_id).first
      @bid.city_id = city.id
    end
    if params[:magistracy].present?
      magis = Magistracy.find(params[:magistracy]) 
      departament = Departament.where(id: magis.departament_id).first
      @bid.magistracy_id = params[:magistracy]
      @bid.departament_id = departament.id
      university = University.where(id: departament.university_id).first
      @bid.university_id = university.id
      city = City.where(id: university.city_id).first
      @bid.city_id = city.id
    end
    if @bid.save

      respond_to do |format|
        format.js
        format.html
      end
    else

      redirect_to request_path
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:name, :phone, :mail, :comment)
  end 

end
