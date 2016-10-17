class StudentsController < ApplicationController
  layout 'personal_area'

  before_action :authenticate



  def show
    @student = current_user  
    @specialty = @student.specialty
    @departament = @specialty.departament
    @univer = @departament.university
    @semesters = @student.semesters
  end

  def semester_info
      semester = Semester.find(params[:semester])
      marks    = semester.assessments
      d_credits = semester.diff_credits
      credits  = semester.credits
      render :json => { :marks => marks , :diff_credits => d_credits, :credits => credits }
  end



end