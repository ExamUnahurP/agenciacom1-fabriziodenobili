//Problemas con el testeo: no me deja hacer el testeo; pasando a seguir escribiendo codigo
class PackDeViaje {
    const duracionEnDias
    const precioBase
    const coordinadorACargo
    const beneficiosEspeciales
    method duracionEnDias() { return duracionEnDias }
    method precioBase() { return precioBase }
    method coordinadorACargo() { return Coordinador }
    method beneficiosEspeciales() { return BeneficioEspecial }
    method soloDospacks() { if (not PackNacional or PackInternacional) self.error("no se puede crear un pack noexistente") }
    method valorFinalDePack() { return precioBase + BeneficioEspecial.costo()}
    method packEsPremium()
}
class PackNacional inherits PackDeViaje {
    const provinciaDestino
    const listaDeActividades = []
    method actividadesDeLaProvincia(actividad) { listaDeActividades.add(actividad) }
    override method packEsPremium() { return duracionEnDias > 10 and Coordinador.altamenteCalificado() }
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
    override method packEsPremium() { return esLugarDeInteres = true and duracionEnDias > 20 and cantidadDeEscalas = 0}
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
    method altamenteCalificado() {
        cantidadDeViajes < 20 and if (rol = "guia") estaMotivado = true else if (rol = "asistente logistico") aniosDeExperiencia < 3 else
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