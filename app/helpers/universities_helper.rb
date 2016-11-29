module UniversitiesHelper

  def univer_cost_ochno(univer_id)
    all_spec = []
    departs = Departament.where(university_id: univer_id)
    if departs != nil
      departs.each do |depart|
        if depart.specialties != nil 
          specialties = Specialty.where(departament_id: depart.id)
          spec = specialties.order(ochno_price: :asc).first
          all_spec << spec.ochno_price if spec&&spec.ochno_price
        end
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
        if depart.specialties != nil   
          specialties = Specialty.where(departament_id: depart.id)
          spec = specialties.order(zaochno_price: :asc).first
          all_spec << spec.zaochno_price if spec&&spec.zaochno_price
        end
      end
    end 
    all_spec.compact.sort!
    all_spec[0]  
  end


  def unitial_cost(departament_id)

    depart = Departament.find(departament_id)
    spec   = Specialty.where(departament_id: depart.id)

    if !(spec.where(zaochno: true).empty?) and !(spec.where(ochno: true).empty?)

      first  = spec.order(zaochno_price: :asc).first.zaochno_price if spec.order(zaochno_price: :asc).first
      second = spec.order(ochno_price: :asc).first.ochno_price if spec.order(ochno_price: :asc).first

      first > second ? second : first
    elsif !(spec.where(ochno: true).empty?)
      spec.order(ochno_price: :asc).first.ochno_price
    else
      spec.order(zaochno_price: :asc).first.zaochno_price
    end
  end

  def unitial_cost_magis(departament_id)

    depart = Departament.find(departament_id)
    magis   = Magistracy.where(departament_id: depart.id)

    if magis.where(zaochno: true).count != 0

        magis.order(zaochno_price: :asc).first.zaochno_price

    else 

      if !magis.empty?
        magis.order(ochno_price: :asc).first.ochno_price
      else

      end

    end
  end



end
