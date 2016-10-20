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

  def semester_penalties
      array_omissions = []
      array_penalties = []
      semester = Semester.find(params[:semester])
      months = semester.months
      months.each do |month|
        hash = Hash.new
        if !month.omissions.empty?
          array_omissions << month.omissions.first
        end
      end
      penalties = semester.penalties
      render :json => { :months => months , :omissions => array_omissions, :penalties => penalties }
  end



end