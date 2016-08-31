ActiveAdmin.register Student do
  menu label: 'Студенты'
  # This determines which attributes of the User model will be
  # displayed in the index page. I have left only username, but
  # feel free to uncomment the rest of the fields or add any
  # other of the User attributes.



  index do
    column 'Личный номер', :username 
    column 'Полное имя', :full_name
    column 'Страна', :country
    # column :current_sign_in_at
    # column :last_sign_in_at
    # column :sign_in_count
    actions
  end

  controller do
    def new
      @student = Student.new(specialty_id: params[:specialty])
      super
    end 

      private 
  end

  # Default is :email, but we need to replace this with :username
  filter :country, as: :select , label:'Страна'
  filter :full_name, label:'Полное имя'


  # This is the form for creating a new user using the Admin
  # backend. If you have added additional attributes to the
  # User model, you need to include them here.

  sidebar " ", only: [:show] do
    ul do
      li link_to "Добавить Семестр",    new_admin_student_semester_path(student)
    end
  end


  action_item only: [:edit] do
    link_to "Профиль, #{student.full_name}", admin_student_path(student),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new,:show] do
    if params[:specialty]
      link_to "Вернуться к Специальности", admin_specialty_path(params[:specialty]),style:"background: white;color: green;margin-top:10px;"
    end
    if student.specialty_id
      link_to "Вернуться к Специальности", admin_specialty_path(student.specialty_id),style:"background: white;color: green;margin-top:10px;"
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "Добавление студента" do
      f.input :specialty, :as => :select, :collection => @specialties, label: "Специальность"
      f.input :username,label: "Личный номер"
      f.input :password,label: "Пароль"
      f.input :password_confirmation, label: "Повторить пароль"
      f.input :full_name, label: "Полное имя"
      f.input :age, label: "Возраст"
      f.input :country, :as => :string, label: "Страна"
      f.input :avatar, label:"Фото" 
    end
    action(:submit)
  end

  sidebar :avatar,  :only => :show do
    image_tag(student.avatar.serv.url)
  end

  show do
    attributes_table do
      row("Специальность"){ |r| result = Specialty.find(r.specialty_id).name if r.specialty_id != nil }
      row("Личный номер"){ |r| r.username }
      row("Полное имя"){ |r| r.full_name } 
      row("Возраст"){ |r| r.age}
      row("Страна"){ |r| r.country }
    end
    table_for Semester.joins(:student).where(:student_id => student).order(number: :asc) do |t|
      t.column("Семестр") { |semester| semester.number }
      t.column("Период") { |semester| semester.period }
      t.column(" ") { |semester| link_to "Открыть", admin_student_semester_path(student,semester) }
      t.column(" ") { |semester| link_to "Изменить", edit_admin_student_semester_path(student,semester) }
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit student: [:username, :password, :password_confirmation, :specialty_id, :full_name, :age, :avatar, :country]
    end
  end

end
