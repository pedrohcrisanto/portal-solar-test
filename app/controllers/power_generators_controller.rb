require 'correios-frete'

class PowerGeneratorsController < ApplicationController
  helper_method :freight
  def index
    @power_generators = PowerGenerator.all.order(:id).page(params[:page])
  end

  def search
    if params[:keywords].present?
      @power_generators = PowerGenerator.search(params[:keywords]).page(params[:page])
    end
  end

  def freight
    # gerador = PowerGenerator.find(1)
    # freight = Correios::Frete::Calculador.new(:cep_origem => "04602-002",
    #                                         :cep_destino => "58101-245",
    #                                         :peso => gerador.weight,
    #                                         :comprimento => gerador.lenght,
    #                                         :largura => gerador.width,
    #                                         :altura => gerador.height)
    # calc_freight = freight.calcular :pac
    # @frete = calc_freight.valor
    frete = CepService.new(params[:cep])
    frete_tabela = Freight.where(state: frete.uf)
    frete_min = frete_tabela.minimum(:cost)
    @power_generator = PowerGenerator.find(params[:id_generator])
    @valor_frete = frete_min
    @state = frete.uf
  end

  def new
    @power_generator = PowerGenerator.new
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
