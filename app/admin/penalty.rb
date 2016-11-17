ActiveAdmin.register Penalty do
  menu false
  belongs_to :semester
  navigation_menu :default
  config.breadcrumb = false




  index do
    column 'Название', :title 
    column 'Дата получения', :data 
    column 'Семестр', :semester_id
    actions
  end

  controller do

    def new
      @penalty = Penalty.new(semester_id: params[:semester_id])

      super
    end  

    def destroy
      
        destroy! do |format|
          format.html { redirect_to admin_student_semester_path(Semester.find(@penalty.semester_id).student.id,Semester.find(@penalty.semester_id).id) } if resource.valid?
        end
      
    end

      private 
  end

  action_item only: [:edit,:show] do
    link_to "Открыть семестр", admin_student_semester_path(Student.find(Semester.find(penalty.semester_id).student_id), Semester.find(penalty.semester_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to 'Назад', :back
  end


  form do |f|
    f.semantic_errors
    f.inputs "Выговор или замечание" do
      f.input :semester, :as => :select, :collection => Semester.all.map{|u| ["Семестр #{u.number}", u.id]}, label: "Семестр"
      f.input :title,label: "Название"
      f.input :data,label: "Дата получения"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Семестр"){ |r| link_to 'Семестр '+ Semester.find(r.semester_id).number.to_s, admin_student_semester_path(Student.find(Semester.find(penalty.semester_id).student_id), Semester.find(penalty.semester_id)) }
      row("Название"){ |r| r.title }
      row("Дата получения"){ |r| r.data }
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit penalty: [:title, :title, :data, :semester_id]
    end
  end


end
