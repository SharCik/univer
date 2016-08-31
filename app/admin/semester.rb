ActiveAdmin.register Semester do
  belongs_to :student




  index do
    column 'Номер семестра', :number 
    column 'Период', :period
    actions
  end

  controller do
    def new
      @semester = Semester.new(student_id: params[:student_id])
      super
    end 

      private 
  end



  action_item only: [:edit,:show] do
    link_to "Профиль, #{Student.find(semester.student_id).full_name}", admin_student_path(Student.find(semester.student_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to "Профиль, #{Student.find(params[:student_id]).full_name}", admin_student_path(Student.find(params[:student_id])),style:"background: white;color: green;margin-top:10px;"
  end


  form do |f|
    f.semantic_errors
    f.inputs "Добавление студента" do
      f.input :student, :as => :select, :collection => @students, label: "Студент"
      f.input :number,label: "Номер семестра"
      f.input :period,label: "Период"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Студент"){ |r| link_to "#{Student.find(r.student_id).full_name}", admin_student_path(Student.find(r.student_id)) }
      row("Номер"){ |r| r.number }
      row("Период"){ |r| r.period } 
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit semester: [:student_id, :number, :period]
    end
  end


end
