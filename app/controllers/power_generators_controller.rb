class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all.order(:id).page params[:page]
  end
end
