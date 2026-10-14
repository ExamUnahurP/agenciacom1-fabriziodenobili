class PackDeViaje {
    const duracionEnDias
    const precioBase
    const coordinadorACargo
    method duracionEnDias() { return duracionEnDias }
    method precioBase() { return precioBase }
    method coordinadorACargo() { return Coordinador }
    method soloDospacks() { if (not PackNacional or PackInternacional) self.error("no se puede crear un pack noexistente") }
    method valorFinalDePack() { return precioBase + BeneficioEspecial.costo()}
}
class PackNacional inherits PackDeViaje {
    const provinciaDestino
    const listaDeActividades = []
    method actividadesDeLaProvincia(actividad) { listaDeActividades.add(actividad) }
}
class PackInternacional inherits PackDeViaje {
    const paisDeDestino
    const cantidadDeEscalas
    const esLugarDeInteres
    method paisDeDestino() { return paisDeDestino }
    method cantidadDeEscalas() { return cantidadDeEscalas }
    method esLugarDeInteres() { return esLugarDeInteres }
    override method valorFinalDePack() {
        super() - valorFinalDePack() * 0.2
    }
}
class Coordinador {
    const cantidadDeViajes
    const estaMotivado
    const aniosDeExperiencia
    var rol //"Guia", "Asistente logistico", "Acompañante"
    method cambiarRol(rolNuevo) {
        if (rolNuevo not "guia" or "Asistente logistico" or "Acompañante") self.error("No existe ese rol")
        else rol = rolNuevo
    }
}
class BeneficioEspecial {
    const tipo = []
    const estaVigente
    method costo() { return cantidadDeBeneficio().filter({tipo => tipo.estaVigente() = true}) }
    method estaVigente() { return estaVigente }
    method agregarBeneficio(beneficioTipo) { tipo.add(beneficioTipo) }
    method cantidadDeBeneficio() { return tipo.size() }
}