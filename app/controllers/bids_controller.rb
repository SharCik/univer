class BidsController < ApplicationController

  def new
    @universities = University.all 
    @university  = University.find(params[:university]) if params[:university].present?
    @bid         = Bid.new
      
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @bid =  Bid.new(bid_params)

    if params[:university].present?
      university = University.find(params[:university])
      @bid.university_id = university.id
      city = City.where(id: university.city_id).first
      @bid.city_id = city.id
    end

    if @bid.save

      BidMailer.bid_new(@bid.id).deliver

      respond_to do |format|
        format.js
        format.html
      end
    else
      flash[:bid_error] = 'Заявка не отправлена!'
      redirect_to request_path
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:name, :phone, :mail, :comment)
  end 

end
