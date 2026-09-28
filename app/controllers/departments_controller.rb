class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find params[:id]
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def department_params
      params.expect department: [ :department_name ]
    end
end
