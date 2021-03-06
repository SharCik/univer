ActiveAdmin.register Credit do
  menu false
  belongs_to :semester
  navigation_menu :default
  config.breadcrumb = false




  index do
    column 'Предмет', :subject 
    column 'Зачтено', :value
    column 'Дата', :data
    actions
  end

  controller do

    def new
      @credit = Credit.new(semester_id: params[:semester_id])

      super
    end 

    def destroy
      
        destroy! do |format|
          format.html { redirect_to admin_student_semester_path(Semester.find(@credit.semester_id).student.id,Semester.find(@credit.semester_id).id) } if resource.valid?
        end
      
    end 


      private 
  end

  action_item only: [:edit,:show] do
    link_to "Вернуться к семестру", admin_student_semester_path(Student.find(Semester.find(credit.semester_id).student_id), Semester.find(credit.semester_id)),style:"background: white;color: green;margin-top:10px;"
  end

  action_item only: [:new] do
    link_to 'Назад', :back
  end


  form do |f|
    f.semantic_errors
    f.inputs "Зачет" do
      f.input :semester, :as => :select, :collection => Semester.all.map{|u| ["#{u.number}", u.id]}, label: "Семестр"
      f.input :subject,label: "Предмет"
      f.input :value,label: "Зачтено"
      f.input :data,label: "Дата"
    end
    action(:submit)
  end

  show do
    attributes_table do
      row("Предмет"){ |r| r.subject }
      row("Оценка"){ |r| r.value ? 'Зачтено' : 'Не зачтено'} 
      row("Дата"){ |r| r.data } 
    end
  end

  # This is related to Rails 4 and how it handles strong parameters.
  # Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit credit: [:subject, :value, :data, :semester_id]
    end
  end


end
