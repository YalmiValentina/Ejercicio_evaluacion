require_relative "participante"

class Equipo
    attr_reader :codigo, :nombre, :participantes  
    def initialize(codigo, nombre)
        @codigo = codigo
        @nombre = nombre
        @participantes = Array.new
    end
end