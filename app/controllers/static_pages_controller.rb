class StaticPagesController < ApplicationController
  def universities
    @univers = University.all
  end

  def services
  end

  def news
  end
end
