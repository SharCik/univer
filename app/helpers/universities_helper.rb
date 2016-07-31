module UniversitiesHelper

  def univer_cost_ochno(univer_id)
    all_spec = []
    departs = Departament.where(university_id: univer_id)
    if departs != nil 
      departs.each do |depart|
        specialties = Specialty.where(departament_id: depart.id)
        all_spec << specialties.order(ochno_price: :asc).first.ochno_price
      end
    end
    all_spec.compact.sort!
    all_spec[0]  
  end

  def univer_cost_zaochno(univer_id)
    all_spec = []
    departs = Departament.where(university_id: univer_id)
    if departs != nil
      departs.each do |depart|  
        specialties = Specialty.where(departament_id: depart.id)
        all_spec << specialties.order(zaochno_price: :asc).first.zaochno_price
      end
    end 
    all_spec.compact.sort!
    all_spec[0]  
  end


  def unitial_cost(departament_id)

    depart = Departament.find(departament_id)
    spec   = Specialty.where(departament_id: depart.id)

    if spec.where(zaochno: true).count != 0

        spec.order(zaochno_price: :asc).first.zaochno_price

    else 

      if !spec.empty?
        spec.order(ochno_price: :asc).first.ochno_price
      else

      end

    end
  end



end
