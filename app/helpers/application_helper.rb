module ApplicationHelper


  def count_specialties(departament)
    Specialty.where(departament_id: departament.id).count
  end

  def count_specialties_univer(univer)
    departaments = Departament.where(university_id: univer)
    result = 0
    departaments.each do |depart|
      result += Specialty.where(departament_id: depart.id).count
    end
    result
  end

  def spec_of_departament(departament)
    Specialty.where(departament_id: departament)
  end



end
