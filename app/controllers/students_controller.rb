class StudentsController < ApplicationController
  layout 'personal_area'

  before_action :authenticate



  def show
    @student = current_user  
    @specialty = @student.specialty
    @departament = @specialty.departament
    @univer = @departament.university
  end



end