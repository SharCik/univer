ActiveAdmin.register Departament do

  menu priority: 5, label: "Факультеты"
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
      @departament = Departament.new(university_id: params[:univer])
      super
    end 
      private 
  end 


  sidebar 'Добавление магистратуры или специальности', :only => :show do
    ul do
    li link_to "Добавить новую специальность в #{departament.name}", new_admin_specialty_path(departament: departament)
    if (University.find(departament.university_id).magistracy == true)
      li link_to "Добавить магистратуру в #{departament.name}",  new_admin_magistracy_path(departament: departament)
    end    
    end
  end


  sidebar '   ', :only => :show do
    link_to "Вернуться к институту #{University.find(departament.university_id).name}", admin_university_path(University.find(departament.university_id).id)
  end


  index title:"Факультеты" do
    column "Название",:name
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :university, :as => :select, :collection => @universities, label: "Университет"
      input :name, label: "Название"
    end
    actions
  end


  show do
    attributes_table do
      row("Название"){ |r| r.name }
    end
    table_for Specialty.joins(:departament).where(:departament_id => departament) do |t|
      t.column("Специальность") { |specialty| link_to specialty.name , admin_specialty_path(specialty) }
      t.column("Изменить") { |specialty| link_to image_tag("edit.png", size:"20x20"), edit_admin_specialty_path(specialty) }
    end
    if (University.find(departament.university_id).magistracy == true)
      table_for Magistracy.joins(:departament).where(:departament_id => departament) do |t|
        t.column("Магистратура") { |magistracy| link_to magistracy.name , admin_magistracy_path(magistracy) }
        t.column("Изменить") { |magistracy| link_to image_tag("edit.png", size:"20x20"), edit_admin_magistracy_path(magistracy) }
      end
    end
  end


  permit_params :name, :university_id


end
