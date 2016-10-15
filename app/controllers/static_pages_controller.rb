class StaticPagesController < ApplicationController
layout "creative"


  def main
    @univers = University.all
  end

  def parents
    
  end

end
