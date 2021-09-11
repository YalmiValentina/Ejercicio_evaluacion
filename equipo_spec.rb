require_relative 'equipo'
require_relative 'participante'

RSpec.describe Equipo do
    context "initialize class equipo" do
        before (:each) do
            @equipo = Equipo.new 'EQ01', 'Karatecas Kids'
        end
        it 'new' do
            expect(@equipo).to be_an_instance_of(Equipo)
        end
        it 'codigo' do
            expect(@equipo.codigo).to eq('EQ01')
        end
    end
end