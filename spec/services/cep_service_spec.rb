describe CepService do
    describe "#fill_data" do
        subject { described_class.new(cep) }
            context "with valid cep" do
                let(:cep) { "58101-245" }
                    it do
                        expect(subject.uf).to eql "PB"
                    end
            end
    end
end