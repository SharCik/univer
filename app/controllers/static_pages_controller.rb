class StaticPagesController < ApplicationController
  def universities
    @univers = University.all
  end

  def services
    @services = Service.paginate(:per_page => 5, :page => params[:page])
  end
end
