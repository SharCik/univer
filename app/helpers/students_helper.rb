module StudentsHelper

  def count_omissions(student)
    result = 0
    student = Student.find(student)
    semester = student.semesters.order(number: :asc).last
    months = semester.months
    months.each do |x|
      result += x.omissions.first.hours
    end
    result
  end

  def count_penalties(student)
    student = Student.find(student)
    student.semesters.order(number: :asc).last.penalties.count
  end

  def last_semester(semesters)
    semesters.order(number: :asc).last
  end


end
