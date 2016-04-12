class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:my_courses]

  def index
  	@courses = Course.all
  end

  def show
  	@course = Course.find(params[:id])
  	@tasks = @course.tasks.order(:tag)

  	@joined = false

  	if !current_user.nil? && !current_user.courses.nil?
  		@joined = current_user.courses.include?(@course)
  	end	
  end

  def my_courses
    if !current_user.nil?
      @courses = current_user.courses
    end  
  end  
end


