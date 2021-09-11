require_relative "participante"
require_relative "equipo"

class Torneo
  attr_accessor  :codigo, :nombre, :edad, :dni, :colorCinturon, :partidasGanadas, :partidasEmpatadas, :partidasPerdidas, :participantes, :equipos
    def initialize 
      @equipos = Array.new
      @participantes = Array.new
    end
  
    def obtener_equipo(codigo)
        for equipo in @equipos
            if equipo.codigo == codigo
                return equipo
            end
        end
        return nil
    end

    def registrar_equipo(codigo, nombre)
        equipo = obtener_equipo(codigo)
        if equipo == nil
            equipo = Equipo.new(codigo, nombre)
            @equipos.push(equipo)
        end
    end
    
    def registrar_participante(codigo, nombre, edad, dni, colorCinturon, partidasGanadas,partidasEmpatadas, partidasPerdidas,codEquipo)
        equipo = obtener_equipo(codEquipo)
        if equipo != nil 
            participante = Participante.new(codigo, nombre, edad, dni, colorCinturon, partidasGanadas,partidasEmpatadas, partidasPerdidas)
            equipo.participantes.push(participante)
            @participantes.push(participante)
        else
            puts "Equipo no encontrado"
        end
    end
    
    def obtener_participante(dni) 
        for participante in @participantes
            if participante.dni == dni
                return participante
            end
        end
        return nil
    end  
    
    def actualizar_partidas_ganadas(dni, partidasGanadas)
        participante = obtener_participante(dni)
        if participante != nil
            participante.partidasGanadas = partidasGanadas
            participante.nuevo_puntaje()
        else
            puts "Participante no encontrado"
        end
    end

    def ganador()
        maxPuntaje = 0
        campeon = nil
        for participante in @participantes
          if participante.nuevo_puntaje > maxPuntaje
            maxPuntaje = participante.nuevo_puntaje
            campeon = participante
          end
        end
        return campeon
    end

    def tabla_posiciones()
        posiciones = []
        for participante in @participantes
          posiciones.push(participante)
        end
        
        for i in 0...posiciones.count
          for j in i+1...posiciones.count
            participanteA = posiciones[i]
            participanteB = posiciones[j]
            if participanteA.nuevo_puntaje < participanteB.nuevo_puntaje
              temporal = participanteA
              posiciones[i] = participanteB
              posiciones[j] = temporal
            end
          end
        end
        
        for i in 0...posiciones.count
          participante = posiciones[i]
          puts "#{i+1}° lugar:"
          print " "
          imprimir_info_participante(participante)
        end
    end
      
    def listar_equipos()
        for equipo in @equipos
          imprimir_info_equipo(equipo)
          totalPuntaje = 0
          for participante in equipo.participantes
            totalPuntaje = totalPuntaje + participante.nuevo_puntaje
          end
          puts " Puntaje total: #{totalPuntaje}"
        end
    end
      
    def imprimir_info_equipo(equipo)
        if equipo == nil
          return
        end
        puts "Equipo: #{equipo.nombre}"
    end
      
    def imprimir_info_participante(participante)
        if participante == nil
          return
        end
        puts "Participante: #{participante.dni} - #{participante.nombre} de #{participante.edad} años. Puntaje actual : #{participante.nuevo_puntaje}"
      end
end

torneo = Torneo.new
torneo.registrar_equipo("EQ01", "equipo1")
torneo.registrar_equipo("EQ02", "equipo2")
torneo.registrar_equipo("EQ03", "equipo3")
torneo.registrar_equipo("EQ04", "equipo4")
torneo.registrar_equipo("EQ05", "equipo5")
torneo.registrar_equipo("EQ06", "equipo6")
torneo.registrar_participante("COD01", "jose", 19, "123456", "verde", 2, 4, 4, "EQ02")
torneo.registrar_participante("COD02", "felipe", 21, "234567", "verde", 0, 4, 2, "EQ02")
torneo.registrar_participante("COD03", "sofia", 31, "345678", "verde", 0, 4, 1, "EQ02")
torneo.registrar_participante("COD04", "marcelo", 15, "456789", "amarillo", 1, 2, 0, "EQ01")
torneo.registrar_participante("COD05", "julieta", 17, "567890", "marron", 10, 5, 0, "EQ03")

#a. desarolle un metodo que permita buscar un participante del torneo por dni
participanteA = torneo.obtener_participante("123456")
torneo.imprimir_info_participante(participanteA)

#obtener el participante ganador del torneo
ganadorTorneo = torneo.ganador()
torneo.imprimir_info_participante(ganadorTorneo)

#listado de tabla de posiciones
puts
torneo.tabla_posiciones()

#listado que modifica el puntaje de partidas ganadas
torneo.actualizar_partidas_ganadas("456789", 15)
participanteB = torneo.obtener_participante("456789")
torneo.imprimir_info_participante(participanteB)

#lista de equipos del torneo y sus puntajes
puts
torneo.listar_equipos()