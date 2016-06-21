module ApplicationHelper


  def count_specialties(departament)
    Specialty.where(departament_id: departament.id).count
  end

  def spec_of_departament(departament)
    Specialty.where(departament_id: departament)
  end



end
