module ApplicationHelper


  def count_specialties(departament)
    Specialty.where(departament_id: departament.id).count
  end


end
