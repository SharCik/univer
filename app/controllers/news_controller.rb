class NewsController < ApplicationController
  def index
    @news = New.paginate(:per_page => 3, :page => params[:page])
  end

  def show
    @new = New.find(params[:id])
    @news = New.last(3)
  end
end
