ActiveAdmin.register Bid do 
  menu priority: 2, label: "Заявки"
  config.filters = false


  
  action_item :view, only: :show do
   
  end

  index title:"Заявки" do
    column "Имя",:name
    column "Телефон",:phone
    column "Email",:mail
    column "Комментарий",:comment
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :city, :as => :select, :collection => @cities, label: "Город"
      input :university, :as => :select, :collection => @universities ,label: "Университет"
      input :departament, :as => :select, :collection => @departaments ,label: "Факультет"
      input :specialty, :as => :select, :collection => @specialties ,label: "Специальность"
      input :magistracy, :as => :select, :collection => @magistracies ,label: "Магистратура"
      input :name, label: "Имя"
      input :phone, label: "Телефон"
      input :mail, label: "Email"
      input :comment, label: "Комментарий"
    end
    actions
  end

  show do
    attributes_table do
      row("Город"){ |r| result = City.find(r.city_id).name if r.city_id != nil }
      row("Университет"){ |r| result = University.find(r.university_id).name if r.university_id != nil }
      row("Имя"){ |r| r.name }
      row("Телефон"){ |r| r.phone }
      row("Email"){ |r| r.mail }
      row("Комментарий"){ |r| number_to_currency r.comment }
    end
  end



  permit_params :name, :phone, :mail,:comment
end