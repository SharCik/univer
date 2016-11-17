ActiveAdmin.register University do
  menu priority: 4, label: "Университеты"
  
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

    def destroy
      
        destroy! do |format|
          if @university.city_id
            if params[:page] == 'index'
              format.html { redirect_to admin_universities_path } if resource.valid?
            else  
              format.html { redirect_to admin_city_path(City.find(@university.city_id).id) } if resource.valid?
            end
          end
        end
      
    end

      private 
  end 


  sidebar 'Факультеты', :only => :show do
    table_for Departament.joins(:university).where(:university_id => university.id) do |t|
      t.column("Открыть") { |departament| link_to departament.name , admin_departament_path(departament) }
      t.column("Изменить") { |departament| link_to image_tag("edit.png", size:"20x20"), edit_admin_departament_path(departament)}
    end
    link_to "Добавить факультет к #{university.short_name}", new_admin_departament_path(univer: university)
  end

  sidebar "Изображение",  :only => :show do
    image_tag(university.image.normal.url, style:'object-fit: cover;width: 250px;height: 190px;')
  end


  action_item only: [:show,:edit,:new] do
    link_to "Список университетов", admin_universities_path ,style:"background: white;color: green;margin-top:10px;"
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
      row("Подготовительное отделение, стоимость"){ |r| r.initial_cost }
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
    actions defaults: false do |university|
      link_to "Открыть", admin_university_path(university)
    end
    actions defaults: false do |university|
      link_to "Изменить", edit_admin_university_path(university)
    end
    actions defaults: false do |university|
      link_to "Удалить", admin_university_path(university,page: 'index'), method: :delete, data: {confirm: "Вы уверены?"}
    end
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
    action(:submit)
  end

  filter :city,  collection: proc { City.all },label: 'Город'


  permit_params :name, :short_name, :description, :image, :initial_cost, :city_id , :preparatory_department, :address , :hostel, :ochno , :zaochno ,:rating, :magistracy

end
