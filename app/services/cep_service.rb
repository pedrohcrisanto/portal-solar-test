require 'net/http'
class CepService
  attr_reader :logradouro, :bairro, :localidade, :uf
  
  END_POINT = "https://viacep.com.br/ws/"
  FORMAT = "json"
  
  def initialize(cep)
    found_cep = find(cep)
    fill_data(found_cep)
  end

  private

  def fill_data(found_cep)
    @logradouro = found_cep["logradouro"]
    @bairro     = found_cep["bairro"]
    @localidade = found_cep["localidade"]
    @uf         = found_cep["uf"]
  end

  def find(cep)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}#{cep}/#{FORMAT}/")
      )
    )
  end
end