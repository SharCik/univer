ActiveAdmin.register Semester do
  menu false
  belongs_to :student
  navigation_menu :default




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

  sidebar "Успеваемость", only: [:show] do
    ul do
      li link_to "Добавить Оценку",    new_admin_semester_assessment_path(semester)
      li link_to "Добавить дифф. зачет",    new_admin_semester_diff_credit_path(semester)
      li link_to "Добавить не дифф. зачет",    new_admin_semester_credit_path(semester)
    end
  end

  sidebar "Пропуски", only: [:show] do
    table_for Month.joins(:semester).where(:semester_id => semester.id) do |t|
      t.column("Месяц") { |month| link_to month.name , admin_semester_month_path(semester,month) }
      t.column("Изменить") { |month| link_to image_tag("edit.png", size:"20x20"), edit_admin_semester_month_path(semester,month) }
    end
    ul do
      li link_to "Добавить Месяц",    new_admin_semester_month_path(semester)
    end
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
    panel "Оценки по экзаменам" do
      table_for Assessment.joins(:semester).where(:semester_id => semester) do |t|
        t.column("Предмет") { |assessment| assessment.subject }
        t.column("Оценка") { |assessment| assessment.value }
        t.column("Дата") { |assessment| assessment.data }
        t.column(" ") { |assessment| link_to "Открыть", admin_semester_assessment_path(semester,assessment) }
        t.column(" ") { |assessment| link_to "Изменить", edit_admin_semester_assessment_path(semester,assessment) }
      end
    end
    panel "Дифференцированные зачеты" do
      table_for DiffCredit.joins(:semester).where(:semester_id => semester) do |t|
        t.column("Предмет") { |diff_credit| diff_credit.subject }
        t.column("Зачтено") { |diff_credit| diff_credit.value}
        t.column("Дата") { |diff_credit| diff_credit.data }
        t.column(" ") { |diff_credit| link_to "Открыть", admin_semester_diff_credit_path(semester,diff_credit) }
        t.column(" ") { |diff_credit| link_to "Изменить", edit_admin_semester_diff_credit_path(semester,diff_credit) }
      end
    end
    panel "Не дифференцированные зачеты" do
      table_for Credit.joins(:semester).where(:semester_id => semester) do |t|
        t.column("Предмет") { |credit| credit.subject }
        t.column("Зачтено") { |credit| credit.value ? 'Зачтено' : 'Не зачтено'}
        t.column("Дата") { |credit| credit.data }
        t.column(" ") { |credit| link_to "Открыть", admin_semester_credit_path(semester,credit) }
        t.column(" ") { |credit| link_to "Изменить", edit_admin_semester_credit_path(semester,credit) }
      end
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
