ActiveAdmin.register AdminUser do
  config.filters = false
 
  menu priority: 1 , label: "Администраторы"
  permit_params :email, :password, :password_confirmation

  index title:"Администраторы" do
    column "Email", :email
    column "Кол-во посещений",:sign_in_count
    column "Создан",:created_at
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
