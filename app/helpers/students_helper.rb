module StudentsHelper

  def count_omissions(student)
    result = 0
    student = Student.find(student)
    semester = student.semesters.order(number: :asc).last
    if semester != nil
      months = semester.months
      months.each do |x|
        result += x.omissions.first.hours if x.omissions.first 
      end
    end
    result
  end

  def count_penalties(student)
    result = 0
    student = Student.find(student)
    if student.semesters == nil
      if student.semesters.last.penalties
        result = student.semesters.order(number: :asc).last.penalties.count
      end
    end
    result
  end

  def last_semester(semesters)
    if semesters
      semesters.order(number: :asc).last
    end
  end


end
