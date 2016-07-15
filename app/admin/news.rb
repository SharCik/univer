ActiveAdmin.register New do
  menu priority: 9, label: "Новости"
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
  sidebar 'Картинка',  :only => :show do
    image_tag(new.news_image.normal.url)
  end


  index title:"Новости" do
    column "Название",:name
    column "Краткое описание",:short_description 
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :name, label: "Название"
      input :short_description, label: "Краткое описание"
      input :description, as: :wysihtml5, commands: [ :bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :image, :source], label: "Полное описание" 
      input :news_image, label: "Картинка"
    end
    actions
  end

  show  do
    attributes_table do
      row("Название"){ |r| r.name }
      row("Краткое описание"){ |r| r.short_description } 
      row("Описание"){ |r| r.description } 
    end
  end


  permit_params :name, :short_description, :description, :news_image

end
