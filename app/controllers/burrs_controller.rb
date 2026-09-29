class BurrsController < ApplicationController
  def index
    @burrs = Burr.all
  end

  def show
  end

  def new
    @burr = Burr.new
  end

  def create
    @burr = Burr.new(burr_params)
    if @burr.save
      redirect_to @burr
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @burr.update(burr_params)
      redirect_to @burr
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @burr.destroy
    redirect_to burrs_path, status: :see_other
  end

  private
    def set_burr
      @burr = Burr.find(params[:id])
    end
  private
    def burr_params
      params.expect burr: [:department_id, :user_id, :amount, :description]
    end
end
