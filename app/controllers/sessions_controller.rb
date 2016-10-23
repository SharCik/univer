class SessionsController < ApplicationController

  def new
    render 'new',:layout => false
  end

  def create 
      student = Student.find_by(username: params[:session][:username].downcase)
      if student && student.authenticate(params[:session][:password])
        login(student)

        redirect_to student_path(student)
      else
        flash.now[:error] = 'Неверный логин или пароль!'

        render 'new',:layout => false
      end
  end

  def destroy
    logout

    redirect_to root_url
  end
end
