class CasesController < ApplicationController
  before_action :set_case, only: %i[
    show edit update destroy]
    
  def index
    @cases = Case.all
  end
  def show
  end  
  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to @case
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @case.update(case_params)
      redirect_to @case
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @case.destroy
    redirect_to cases_path, status: :see_other
  end

  private
    def set_case
      @case = Case.find(params[:id])
    end
  private
    def case_params
      params.expect case: [:user_id, :type, :description, :amount]
end
