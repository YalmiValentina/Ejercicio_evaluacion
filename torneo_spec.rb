require_relative 'equipo'
require_relative 'participante'
require_relative 'torneo'

RSpec.describe Torneo do
    context "initialize class torneo" do
        before (:each) do
            @torneo = Torneo.new 
        end
        it 'nuevo' do
            expect(@torneo).to be_an_instance_of(Torneo)
        end
    end
    context 'validacion_registros' do
        it 'registrarequipos' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            expect(@torneo.equipos[0]).to have_attributes(codigo: "EQ02")
        end

        it 'registrarparticipante' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            expect(@torneo.participantes[0]).to have_attributes(nombre: "jose")
        end
    end
    context 'validacion_obtencion' do
        it 'obtener_equipos' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.obtener_equipo "EQ02"
            expect(@torneo.equipos[0]).to have_attributes(codigo: "EQ02")
        end
        it 'obtener_participante' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.obtener_participante "123456"
            expect(@torneo.participantes[0]).to have_attributes(dni: "123456")
        end
    end
    context 'operaciones' do
        it 'actualizar_partidas_ganadas' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.actualizar_partidas_ganadas "123456", 2
            expect(@torneo.participantes[0]).to have_attributes(dni: "123456")
        end
        it 'ganador' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.ganador
            expect(@torneo.participantes[0]).to have_attributes(dni: "123456")
        end
        it 'tabla_posiciones' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.tabla_posiciones
            expect(@torneo.participantes[0]).to have_attributes(dni: "123456")
        end
        it 'listar_equipos' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.listar_equipos
            expect(@torneo.equipos[0]).to have_attributes(codigo: "EQ02")
        end
        it 'imprimir_info_equipo' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.imprimir_info_equipo @equipo
            expect(@torneo.equipos[0]).to have_attributes(codigo: "EQ02")
        end
        it 'imprimir_info_participante' do
            @torneo = Torneo.new
            @torneo.registrar_equipo "EQ02", "equipo2"
            @torneo.registrar_participante "COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02"
            @torneo.imprimir_info_equipo @participante
            expect(@torneo.participantes[0]).to have_attributes(dni: "123456")
        end
    end
end
