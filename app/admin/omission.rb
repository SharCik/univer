ActiveAdmin.register Omission do
  menu false
  belongs_to :month
  navigation_menu :default
  config.breadcrumb = false




  index do
    column 'Количество пропусков:', :hours 
    column 'Семестр', :month_id
    actions
  end

  controller do

    def new
      @omission = Omission.new(month_id: params[:month_id])

      super
    end  


      private 
  end

  action_item only: [:edit,:show] do
    link_to "Открыть месяц", admin_semester_month_path(Semester.find(Month.find(omission.month_id).semester_id), Month.find(omission.month_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to 'Назад', :back
  end


  form do |f|
    f.semantic_errors
    f.inputs "Месяц" do
      f.input :month, :as => :select, :collection => Month.all.map{|u| ["#{u.name}", u.id]}, label: "Месяц"
      f.input :hours,label: "Кол-во часов:"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Месяц"){ |r| link_to Month.find(r.month_id).name, admin_semester_month_path(Semester.find(Month.find(r.month_id).semester_id), Month.find(r.month_id)) } 
      row("Кол-во часов:"){ |r| r.hours }
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit omission: [:hours, :month_id]
    end
  end


end
