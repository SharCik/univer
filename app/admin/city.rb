ActiveAdmin.register City do 
  menu priority: 2

  sidebar :new_university,  :only => :show do
    link_to "New university for #{city.name}", new_admin_university_path(city: city)
  end

  sidebar :picture,  :only => :show do
    image_tag(city.image_city.normal.url, size:"240x175")
  end

  show do
      attributes_table :name
    table_for University.joins(:city).where(:city_id => city.id) do |t|
      t.column("Universities") { |university| link_to university.name , admin_university_path(university) }
      t.column("Edit") { |university| link_to image_tag("edit.png", size:"20x20"), edit_admin_university_path(university) }
    end
  end


  filter :created_at
  filter :updated_at


  permit_params :name, :image_city
end