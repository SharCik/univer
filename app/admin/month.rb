ActiveAdmin.register Month do
  menu false
  belongs_to :semester
  navigation_menu :default
  config.breadcrumb = false




  index do
    column 'Название', :name 
    column 'Семестр', :semester_id
    actions
  end

  controller do

    def new
      @month = Month.new(semester_id: params[:semester_id])

      super
    end  


      private 
  end

  sidebar "Пропуски", only: [:show] do
    table_for Omission.joins(:month).where(:month_id => month.id) do |t|
      t.column("Кол-во пропущенных часов") { |omission| omission.hours }
      t.column("Изменить") { |omission| link_to image_tag("edit.png", size:"20x20"), edit_admin_month_omission_path(month,omission) }
    end
    ul do
      li link_to "Добавить пропуски за месяц",    new_admin_month_omission_path(month)
    end
  end

  action_item only: [:edit,:show] do
    link_to "Вернуться к семестру", admin_student_semester_path(Student.find(Semester.find(month.semester_id).student_id), Semester.find(month.semester_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to 'Назад', :back
  end


  form do |f|
    f.semantic_errors
    f.inputs "Месяц" do
      f.input :semester, :as => :select, :collection => Semester.all.map{|u| ["#{u.number}", u.id]}, label: "Семестр"
      f.input :name,label: "Название"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Название"){ |r| r.name }
      row("Семестр"){ |r| r.semester_id } 
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit month: [:name, :semester_id]
    end
  end


end
