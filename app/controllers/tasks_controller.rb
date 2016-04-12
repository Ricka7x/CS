class TasksController < ApplicationController
	before_action :authenticate_user!

  def show
  	course = Course.find(params[:course_id])
  	@tasks = course.tasks
  	
  	# @next_task = @task.next 
  	# @next_task = @task.prev 
  	joined = false

  	if !current_user.nil? && !current_user.courses.nil?
  		joined = current_user.courses.include?(course)
  	end	

  	if joined

  		@task = @tasks.find(params[:id])
  	else
  		flash[:notice] = "You need to be enrolled before continuing"	
  		redirect_to course
  	end	
  end
end
