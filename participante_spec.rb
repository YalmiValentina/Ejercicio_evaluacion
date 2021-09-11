require_relative "participante"

RSpec.describe Participante do
    context "initialize class participante" do
        before (:each) do
            @participante = Participante.new 'COD01', 'Felipe' , 20, '12345678', 'verde', 2, 4, 1
        end
        it 'new' do
            expect(@participante).to be_an_instance_of(Participante)
        end
        it 'codigo' do
            expect(@participante.codigo).to eq('COD01')
        end
        it 'nombre' do
            expect(@participante.nombre).to eq('Felipe')
        end
        it 'edad' do
            expect(@participante.edad).to eq(20)
        end
        it 'dni' do
            expect(@participante.dni).to eq('12345678')
        end
        it 'colorCinturon' do
            expect(@participante.colorCinturon).to eq('verde')
        end
        it 'partidasGanadas' do
            expect(@participante.partidasGanadas).to eq(2)
        end
        it 'partidasEmpatadas' do
            expect(@participante.partidasEmpatadas).to eq(4)
        end
        it 'partidasPerdidas' do
            expect(@participante.partidasPerdidas).to eq(1)
        end
    end
end
