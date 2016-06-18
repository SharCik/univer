ActiveAdmin.register Departament do
  

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


  sidebar 'Specialties by this Departament', :only => :show do
    table_for Specialty.joins(:departament).where(:departament_id => departament) do |t|
      t.column("Show") { |specialty| link_to specialty.name , admin_specialty_path(specialty) }
      t.column("Edit") { |specialty| link_to image_tag("edit.png", size:"20x20"), edit_admin_specialty_path(specialty) }
    end
    link_to "New specialty for #{departament.name}", new_admin_specialty_path(departament: departament)
  end


  index do
    column :name
    column :initial_cost do |product|
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
    attributes_table :name, :university_id, :initial_cost
  end


  permit_params :name, :university_id, :initial_cost


end
