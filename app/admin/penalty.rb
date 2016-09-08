ActiveAdmin.register Penalty do
  menu false
  belongs_to :month
  navigation_menu :default
  config.breadcrumb = false




  index do
    column 'Название', :title 
    column 'Дата получения', :data 
    column 'Месяц', :month_id
    actions
  end

  controller do

    def new
      @penalty = Penalty.new(month_id: params[:month_id])

      super
    end  


      private 
  end

  action_item only: [:edit,:show] do
    link_to "Открыть месяц", admin_semester_month_path(Semester.find(Month.find(penalty.month_id).semester_id), Month.find(penalty.month_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to 'Назад', :back
  end


  form do |f|
    f.semantic_errors
    f.inputs "Выговор или замечание" do
      f.input :month, :as => :select, :collection => Month.all.map{|u| ["#{u.name}", u.id]}, label: "Месяц"
      f.input :title,label: "Название"
      f.input :description,label: "Описание"
      f.input :data,label: "Дата получения"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Месяц"){ |r| link_to Month.find(r.month_id).name, admin_semester_month_path(Semester.find(Month.find(r.month_id).semester_id), Month.find(r.month_id)) } 
      row("Название"){ |r| r.title }
      row("Описание"){ |r| r.description }
      row("Дата получения"){ |r| r.data }
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit penalty: [:title, :title, :description, :data, :month_id]
    end
  end


end
