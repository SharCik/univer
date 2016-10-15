module StudentsHelper

  def count_omissions(student)
    result = 0
    months = full_information(student)
    months.each do |x|
      omis = x.omissions
      omis.each{|x| result += x.hours}
    end
    result
  end

  def count_penalties(student)
    result = 0
    months = full_information(student)
    months.each do |x|
      result += x.penalties.count
    end
    result
  end

  def full_information(student)
    student = Student.find(student)
    semester = student.semesters.order(number: :asc).last
    months = semester.months
  end


end
