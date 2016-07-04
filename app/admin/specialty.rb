ActiveAdmin.register Specialty do
  menu priority: 7, label: "Специальности"
  config.filters = false


  config.batch_actions = false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def new
      @specialty = Specialty.new(departament_id: params[:departament])
      super
    end 
      private 
  end 


  index title:"Специальности" do
    column "Название",:name
    column "Квалификация",:profession
    column "Время обучения",:training_period
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :departament, :as => :select, :collection => @departaments, label: "Факультет"
      input :name, label: "Название"
      input :profession, label: "Квалификация"
      input :training_period, label: "Время обучения"
      input :ochno, label: "Очно"
      input :zaochno, label: "Заочно"
      input :ochno_price, label: "Очно, цена"
      input :zaochno_price, label: "Заочно, цена"
    end
    actions
  end

  show do
    attributes_table do
      row("Факультет"){ |r| result = Departament.find(r.departament_id).name if r.departament_id != nil }
      row("Название"){ |r| r.name }
      row("Квалификация"){ |r| r.profession } 
      row("Время обучения"){ |r| r.training_period }
      row("Очно"){ |r| r.ochno  == true ? "Есть" : "Нет" }
      row("Заочно"){ |r| r.zaochno == true ? "Есть" : "Нет" }
      row("Очно, стоимость"){ |r| r.ochno_price.to_s + " $" }
      row("Заочно, стоимость"){ |r| r.zaochno_price.to_s + " $" }
    end
  end

  permit_params :name, :departament_id, :ochno, :zaochno, :ochno_price, :zaochno_price,  :profession, :training_period

end
