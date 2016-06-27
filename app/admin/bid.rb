ActiveAdmin.register Bid do 
  menu label: "Заявки"


  filter :city
  filter :university
  filter :created_at
  
  action_item :view, only: :show do
   
  end

  index title:"Заявки" do
    column "Имя",:name
    column "Телефон",:phone
    column "Email",:mail
    column "Комментарий",:comment
    actions
  end



  permit_params :name, :phone, :mail,:comment
end