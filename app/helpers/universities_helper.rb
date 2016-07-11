module UniversitiesHelper

  def univer_cost_ochno(univer_id)
    depart = Departament.where(university_id: univer_id).first
    if Specialty.where(departament_id: depart.id) != nil
      specialties = Specialty.where(departament_id: depart.id)
      specialties.order(ochno_price: :asc).first.ochno_price
    else

    end  
  end

  def univer_cost_zaochno(univer_id)
    depart = Departament.where(university_id: univer_id).first
    if Specialty.where(departament_id: depart.id) != nil
      specialties = Specialty.where(departament_id: depart.id)
      specialties.order(zaochno_price: :asc).first.zaochno_price
    else

    end 
  end


  def unitial_cost(departament_id)

    depart = Departament.find(departament_id)
    spec   = Specialty.where(departament_id: depart.id)

    if spec.where(zaochno: true).count != 0

        spec.order(zaochno_price: :asc).first.zaochno_price

    else 

      if spec != nil
        spec.order(ochno_price: :asc).first.ochno_price
      else

      end

    end
  end



end
