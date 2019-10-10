class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all.order(:id).page params[:page]
  end

  def search
    if params[:keywords].present?
      @power_generators_search = PowerGenerator.search(params[:keywords])
    end
  end

  def new
    @power_generator = Power.new
  end

  def create
    @power_generator = PowerGenerator.new(power_generator_params)
  end

  private

  def power_generator_params
    params.require(:power_generator).permit(
      :name, :description, :image_url, :manufacturer, :price, :kwp, :height,
      :lenght, :weight, :structure_type, :cube_weight
    )
  end
end
