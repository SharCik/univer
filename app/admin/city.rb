ActiveAdmin.register City do 
  menu priority: 3, label: "Города"
  config.filters = false

  sidebar 'Создать новый университет:',  :only => :show do
    link_to "Добавить университет к \"#{city.name}\"", new_admin_university_path(city: city)
  end

  sidebar :picture,  :only => :show do
    image_tag(city.image_city.normal.url, size:"240x175")
  end


  index title:"Города" do
    column "Название", :name
    actions
  end

  show do
    attributes_table :name
    panel "Университеты" do
      table_for University.joins(:city).where(:city_id => city.id) do |t|
        t.column("Название") { |university| link_to university.name , admin_university_path(university) }
        t.column("Изменить") { |university| link_to image_tag("edit.png", size:"20x20"), edit_admin_university_path(university) }
      end
    end
  end



  form do |f|
    f.semantic_errors
    inputs 'Details' do
      input :name, label: "Название"
      input :image_city, label: "URL картинки"
    end
    actions
  end



  permit_params :name, :image_city
end