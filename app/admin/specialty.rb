ActiveAdmin.register Specialty do
  menu false
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

  sidebar " ", only: [:show] do
    ul do
      li link_to "Добавить Студента",    new_admin_student_path(specialty: specialty)
    end
  end

  index title:"Специальности" do
    column "Название",:name
    column "Квалификация",:profession
    actions
  end

  action_item only: [:new,:show] do
    link_to "Вернуться к факультету", admin_departament_path(Departament.find(specialty.departament_id).id),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:edit] do
    link_to "Специальность '#{specialty.name}'", admin_specialty_path(specialty.id),style:"background: white;color: green;margin-top:10px;"
  end


  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :departament, :as => :select, :collection => @departaments, label: "Факультет"
      input :name, label: "Название"
      input :profession, label: "Квалификация"
      input :ochno, label: "Очно"
      input :zaochno, label: "Заочно"
      input :training_period, label: "Очно, время обучения"
      input :training_period_zaochno, label: "Заочно, время обучения"
      input :ochno_price, label: "Очно, цена"
      input :zaochno_price, label: "Заочно, цена"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Факультет"){ |r| result = Departament.find(r.departament_id).name if r.departament_id != nil }
      row("Название"){ |r| r.name }
      row("Квалификация"){ |r| r.profession } 
      row("Очно"){ |r| r.ochno  == true ? "Есть" : "Нет" }
      row("Заочно"){ |r| r.zaochno == true ? "Есть" : "Нет" }
      row("Очно, время обучения"){ |r| r.training_period }
      row("Заочно, время обучения"){ |r| r.training_period_zaochno}
      row("Очно, стоимость"){ |r| r.ochno_price.to_s + " $" }
      row("Заочно, стоимость"){ |r| r.zaochno_price.to_s + " $" }
    end
    panel "Студенты" do
      table_for Student.joins(:specialty).where(:specialty_id => specialty) do |t|
        t.column("Студент") { |student| student.full_name }
        t.column("Личный номер") { |student| student.username }
        t.column(" ") { |student| link_to "Профиль", admin_student_path(student) }
        t.column(" ") { |student| link_to "Изменить", edit_admin_student_path(student) }
      end
    end
  end
 

  permit_params :name, :departament_id, :ochno, :zaochno, :ochno_price, :zaochno_price,  :profession, :training_period, :training_period_zaochno

end
