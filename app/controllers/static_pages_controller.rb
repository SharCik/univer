class StaticPagesController < ApplicationController
layout "creative"


  def main
    @univers = University.all
  end

end
