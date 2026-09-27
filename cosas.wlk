object knightRider {

    method peso() = 500
    method bultoQueOcupa() = 1
    method nivelDePeligrosidad() = 10
    method sufrirCambios() {
            
    }
}

object bumblebee {
    var estaComoRobot = false
    
    method estaComoRobot() = estaComoRobot
    method bultoQueOcupa() = 2
    method peso() = 800

    method nivelDePeligrosidad() = if (estaComoRobot) 30 else 15 
  
    method transformar() {
      estaComoRobot = not estaComoRobot
    }

    method sufrirCambios() {
      estaComoRobot = true
    }
}

object paqueteDeLadrillos {
    var ladrillos = 0

    method ladrillos() = ladrillos
    method hayLadrillos() = ladrillos > 0

    method sufrirCambios() {
      self.agregarLadrillos(12)
    }

    method bultoQueOcupa() = 
        if (not self.hayLadrillos()) 0
        else if (ladrillos <= 100) 1
        else if (ladrillos <= 300) 2
        else 3

    method peso() = ladrillos * 2 

    method nivelDePeligrosidad() = 2

    method agregarLadrillos(cantidad) {
      ladrillos += cantidad
    }

    method sacarLadrillos(cantidad) {
      ladrillos -= cantidad
    }
}

object arenaAGranel {
    var peso = 0

    method peso() = peso
    method bultoQueOcupa() = 1 
    method nivelDePeligrosidad() = 1

    method sufrirCambios() {
      peso = (peso - 10).max(0)
    }

    method agregarArena(cantidad) {
      peso += cantidad
    }

    method sacarArena(cantidad) {
      peso -= cantidad
    }


}

object bateriaAntiaerea {
    var estaConMisiles = true

    method peso() = if (estaConMisiles) 300 else 200
    method estaConMisiles() = estaConMisiles
    method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0  
    method bultoQueOcupa() = if(self.estaConMisiles() == true) 2 else 1

    method cargarMisiles() {
      estaConMisiles = true
    }

    method descargarMisiles() {
      estaConMisiles = false
    }

}

object contenedorPortuario {
    const objetosDentro = []

    method objetosDentro() = objetosDentro
    method bultosQueOcupa() = 1 + objetosDentro.sum{o => o.bultoQueOcupa()}
    method peso() = 100 + objetosDentro.sum{o => o.peso()}

    method nivelDePeligrosidad() = if (objetosDentro.isEmpty()) 0 else objetosDentro.max {o => o.nivelDePeligrosidad()}.nivelDePeligrosidad() 

    method cargarContenedor(nuevosObjetos) {
      objetosDentro.addAll(nuevosObjetos)
    }
}

object residuosRadioactivos {
    var peso = 0

    method peso() = peso

    method nivelDePeligrosidad() = 200

    method agregarResiduos(cantidad) {
      peso += cantidad
    }

    method sacarResiduos(cantidad) {
      peso -= cantidad
    }

}

object embalajeDeSeguridad {
    const cubre = []

    method peso() = cubre.sum {c => c.peso()}
    method bultoQueOcupa() = 2
    method nivelDePeligrosidad() = cubre.sum {c => c.nivelDePeligrosidad()} / 2

    method cubre() = cubre 

    method cosasACubrir(nuevasCosas) {
      cubre.addAll(nuevasCosas)
      
    }
}