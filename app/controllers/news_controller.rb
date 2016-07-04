class NewsController < ApplicationController
  def index
    @news = New.paginate(:per_page => 3, :page => params[:page])
  end

  def show
  end
end
