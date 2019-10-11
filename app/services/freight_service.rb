class FreightService
    def initialize(cep, id)
        gerador = PowerGenerator.find(params[:id_generator])
        freight = Correios::Frete::Calculador.new(:cep_origem => "04602-002",
                                                :cep_destino => params[:cep],
                                                :peso => gerador.weight,
                                                :comprimento => gerador.lenght,
                                                :largura => gerador.width,
                                                :altura => gerador.height)
        calc_freight = freight.calcular :sedex
        calc_freight.valor
    end
end