module ApplicationHelper


  def count_specialties(departament)
    Specialty.where(departament_id: departament.id).count
  end

  def count_magis(departament)
    Magistracy.where(departament_id: departament.id).count
  end

  def count_universities
    University.all.count
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

  def magis_of_departament(departament)
    Magistracy.where(departament_id: departament)
  end

  def depart_request(specialty)
    spec =Specialty.find(specialty)
    departament = Departament.where(id: spec.departament_id).first
    departament.id
  end

  def university_request(specialty)
    spec =Specialty.find(specialty)
    departament = Departament.where(id: spec.departament_id).first
    University.where(id: departament.university_id).first.id
  end

  def depart_request_magis(magistracy)
    magis =Magistracy.find(magistracy)
    departament = Departament.where(id: magis.departament_id).first
    departament.id
  end

  def university_request_magis(magistracy)
    magis =Magistracy.find(magistracy)
    departament = Departament.where(id: magis.departament_id).first
    University.where(id: departament.university_id).first.id
  end


end
