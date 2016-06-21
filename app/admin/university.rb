ActiveAdmin.register University do
  menu priority: 3
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
    attributes_table :name, :short_name, :description, :city_id , :preparatory_department, :address , :hostel, :initial_cost , :cost_ochno, :cost_zaochno
  end

  index do
    column :name
    column :short_name
    column :description do |object|
      object.description.slice(0, 100) +"..."
    end
    column :city
    column :address
    column :preparatory_department
    column :hostel
    column :initial_cost do |product|
      number_to_currency product.initial_cost
    end
    actions
  end

  filter :departaments
  filter :city
  filter :name
  filter :initial_cost
  filter :created_at
  filter :updated_at

  permit_params :name, :short_name, :description, :image, :initial_cost, :city_id , :preparatory_department, :address , :hostel, :cost_ochno , :cost_zaochno

end
