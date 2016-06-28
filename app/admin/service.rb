ActiveAdmin.register Service do
  menu label: "Услуги"
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
  sidebar 'Картинка',  :only => :show do
    image_tag(service.service_image.normal.url)
  end


  index title:"Услуги" do
    column "Название",:name
    column "Описание услуги",:description 
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :name, label: "Название"
      input :description, label: "Описание"
      input :service_image, label: "Картинка"
    end
    actions
  end

  show  do
    attributes_table do
      row("Название"){ |r| r.name }
      row("Описание"){ |r| r.description } 
    end
  end


  permit_params :name, :description, :service_image

end
