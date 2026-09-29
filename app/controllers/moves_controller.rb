class MovesController < ApplicationController
  before_action :set_move, only: %i[
    show edit update destroy]
    
  def index
    @moves = Move.all
  end

  def show
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)
    if @move.save
      redirect_to @move
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @move.update(move_params)
      redirect_to @move
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @move.destroy
    redirect_to moves_path, status: :see_other
  end

  private
    def move_params
      params.expect move: [ :department_id, :user_id, :amount, :move_type, :description ]
    end
  private
    def set_move
      @move = Move.find(params[:id])
    end
end
