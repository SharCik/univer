class SessionsController < ApplicationController

  def new

  end

  def create 
      student = Student.find_by(username: params[:session][:username].downcase)
      if student && student.authenticate(params[:session][:password])
        login(student)

        redirect_to student_path(student)
      else
        flash.now[:error] = 'Invalid password or email!' # Not quite right!

        render 'new'
      end
  end

  def destroy
    logout

    redirect_to root_url
  end
end
