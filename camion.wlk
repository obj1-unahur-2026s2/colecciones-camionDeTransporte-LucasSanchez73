import cosas.*

object camion {
    const carga = []
    const cosasQueSuperanNivelDePeligrosidad = [] 
    var bultos = 0

    method carga()  = carga
    method bultos() = bultos

    method cargarCosa(cosaACargar){
        carga.add(cosaACargar)
        cosaACargar.sufrirCambios()}
    

    method descargarCosa(cosaADescargar) {
        carga.remove(cosaADescargar)
    }

    method peso() = 1000 + carga.sum {c => c.peso()}

    method elPesoEsNumeroPar() = carga.all {c => c.peso().even()}

    method algoPesa(unPeso) = carga.any {c => c.peso() == unPeso}

    method primerCosaCon_NivelDePeligrosidad(unNivel) = carga.find {c => c.nivelDePeligrosidad() == unNivel}

    method cosasQueSuperan_NivelDePeligrosidad(unNivel) = carga.filter {c => c.nivelDePeligrosidad() == unNivel }

    method cosasQueSuperanNivelDePeligrosidad() = cosasQueSuperanNivelDePeligrosidad

    method superaPesoMaximo() = carga.sum {c => c.peso()} >= 2500

    method puedeCircularEnRuta(unNivel) = self.superaPesoMaximo() and self.cosasQueSuperan_NivelDePeligrosidad(unNivel)

    method hayAlgoQuePeseEntre_Y_(unPeso, otroPeso) = carga.filter{c => c.between(unPeso, otroPeso)}

    method cargaMasPesada() = carga.find{c => c.peso().max()}



}