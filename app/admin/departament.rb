ActiveAdmin.register Departament do

  menu label: "Факультеты"

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
    li link_to "Добавить магистратуру в #{departament.name}",  new_admin_magistracy_path(departament: departament)    
    end
  end


  index title:"Факультеты" do
    column "Название",:name
    column "Начальная стоимость",:initial_cost do |product|
      number_to_currency product.initial_cost
    end
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    attributes_table do
      row("Название"){ |r| r.name }
      row("Начальная стоимость"){ |r| number_to_currency r.initial_cost } 
    end
    table_for Specialty.joins(:departament).where(:departament_id => departament) do |t|
      t.column("Специальность") { |specialty| link_to specialty.name , admin_specialty_path(specialty) }
      t.column("Изменить") { |specialty| link_to image_tag("edit.png", size:"20x20"), edit_admin_specialty_path(specialty) }
    end
    table_for Magistracy.joins(:departament).where(:departament_id => departament) do |t|
      t.column("Магистратура") { |magistracy| link_to magistracy.name , admin_magistracy_path(magistracy) }
      t.column("Изменить") { |magistracy| link_to image_tag("edit.png", size:"20x20"), edit_admin_magistracy_path(magistracy) }
    end
  end


  permit_params :name, :university_id, :initial_cost


end
