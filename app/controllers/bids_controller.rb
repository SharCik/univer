class BidsController < ApplicationController

  def new
    @university = University.find(params[:university])
    @departament = Departament.find(params[:departament])
    @specialty = Specialty.find(params[:specialty])
    @bid = Bid.new
  end

  def create

    @bid =  Bid.new(bid_params)
    spec = Specialty.find(params[:specialty])
    departament = Departament.where(id: spec.departament_id).first
    @bid.specialty_id = params[:specialty]
    @bid.departament_id = departament.id
    university = University.where(id: departament.university_id).first
    @bid.university_id = university.id
    city = City.where(id: university.city_id).first
    @bid.city_id = city.id
    if @bid.save!

      redirect_to root_path
    else

      redirect_to request_path
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:name, :phone, :mail, :comment, :initial_cost)
  end 

end
