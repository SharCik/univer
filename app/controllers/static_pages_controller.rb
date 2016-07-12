class StaticPagesController < ApplicationController

  def main
    @univers = University.all
  end

  def universities
    @univers = University.all
    @univers = University.paginate(:per_page => 5, :page => params[:page])
  end

  def services
    @services = Service.paginate(:per_page => 5, :page => params[:page])
  end
end
