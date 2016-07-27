ActiveAdmin.register University do
  menu priority: 4, label: "Университеты"
  config.filters = false
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

  config.batch_actions = false

  controller do
    def new
      @university = University.new(city_id: params[:city])
      super
    end 
      private 
  end 


  sidebar 'Departaments by this University', :only => :show do
    table_for Departament.joins(:university).where(:university_id => university.id) do |t|
      t.column("Show") { |departament| link_to departament.name , admin_departament_path(departament) }
      t.column("Edit") { |departament| link_to image_tag("edit.png", size:"20x20"), edit_admin_departament_path(departament) }
    end
    link_to "New departament for #{university.short_name}", new_admin_departament_path(univer: university)
  end

  sidebar :picture,  :only => :show do
    image_tag(university.image.normal.url)
  end


  show do
    attributes_table do
      row("Город"){ |r| result = City.find(r.city_id).name if r.city_id != nil }
      row("Название"){ |r| r.name }
      row("Аббревиатура"){ |r| r.short_name } 
      row("Описание"){ |r| r.description }
      row("Адрес"){ |r| r.address }
      row("Очно"){ |r| r.ochno == true ? "Есть" : "Нет" }
      row("Заочно"){ |r| r.zaochno == true ? "Есть" : "Нет" }
      row("Подготовительное отделение"){ |r| r.preparatory_department == true ? "Есть" : "Нет" }
      row("Общежитие"){ |r| r.hostel == true ? "Есть" : "Нет" }
      row("Магистратура"){ |r| r.magistracy == true ? "Есть" : "Нет" }
      row("Подготовительное отделение, стоимость"){ |r| number_to_currency r.initial_cost }
      row("Рейтинг"){ |r| r.rating }
    end
  end



  index title:"Университеты" do
    column "Название",:name
    column "Аббревиатура",:short_name
    column "Описание",:description do |object|
      object.description.slice(0, 100) +"..."
    end
    column "Город",:city
    column "Адрес",:address
    column "Подготовительное отделение",:initial_cost do |product|
      product.initial_cost.to_s + " $"
    end
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :city, :as => :select, :collection => @cities, label:"Город"
      input :name, label: "Название"
      input :short_name, label: "Аббревиатура"
      input :description, label: "Описание"
      input :address, label: "Адрес"
      input :ochno, label: "Очно"
      input :zaochno, label: "Заочно"
      input :preparatory_department, label: "Подготовительное отделение"
      input :hostel, label: "Общежитие"
      input :magistracy, label: "Магистратура"
      input :initial_cost, label: "Подготовительное отделение, стоимость"
      input :rating, label: "Рейтинг"
      input :image, label: "Картинка"
    end
    actions
  end


  permit_params :name, :short_name, :description, :image, :initial_cost, :city_id , :preparatory_department, :address , :hostel, :ochno , :zaochno ,:rating, :magistracy

end
