//dependencias
class Dependencia {
  var empleados
  var flotaDeRodados = #{}

  method agregarAFlota(rodado) {
    flotaDeRodados.add(rodado)
  }

  method quitarDeFlota(rodado) {
    flotaDeRodados.remove(rodado)
  }

  method pesoTotalFlota() = flotaDeRodados.map{ f => f.peso() }.sum()

  method estaBienEquipada() = flotaDeRodados.size() > 3 && flotaDeRodados.all({r => r.velocidadMaxima() >= 100})

  method capacidadTotalEnColor(color) = flotaDeRodados.filter({f => f.color() == color}).sum({f => f.capacidad()})

  method colorDelRodadoMasRapido() = flotaDeRodados.max{f => f.velocidadMaxima()}.color()

  method capacidadFaltante() = empleados - flotaDeRodados.map{ f => f.capacidad() }.sum()

  method esGrande() = empleados >= 40 && flotaDeRodados.size() >= 5
}

//rodados
class Corsa {
  var property color
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 1300
}

class Kwid {
  var tieneTanque
  method capacidad() = if (!tieneTanque) 4 else 3
  method velocidadMaxima() = if (!tieneTanque) 120 else 110
  method peso() = 1200 + if (tieneTanque) 150 else 0
  method color() = 'Azul'
}

class Trafic {
  var interior
  var motor

  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidadMaxima()
  method peso() = 4000 + motor.peso() + interior.peso()
  method color() = "Blanco"
}

class AutoEspecial {
  var property capacidad
  var property velocidadMaxima
  var property peso
  var property color
}

//traffic caracteristicas
object interiorComodo {
  method capacidad() = 5
  method peso() = 700
}

object interiorPopular {
  method capacidad() = 12
  method peso() = 1000
}

object motorPulenta {
  method velocidadMaxima() = 130
  method peso() = 800
}

object motorBataton {
  method velocidadMaxima() = 80
  method peso() = 500
}