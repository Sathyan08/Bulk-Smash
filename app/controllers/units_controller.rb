class UnitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to @unit, notice: 'Successfully Created!'
    else
      flash[:notice] = "Could Not Save"
      render :new
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
