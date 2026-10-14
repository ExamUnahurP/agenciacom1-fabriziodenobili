class PackDeViaje {
    const duracionEnDias
    const precioBase
    const beneficiosEspeciales
    const coordinadorACargo
    method duracionEnDias() { return duracionEnDias }
    method precioBase() { return precioBase }
    method beneficiosEspeciales() { return beneficiosEspeciales }
    method coordinadorACargo() { return Coordinador }
    method soloDospacks() { if (not PackNacional or PackInternacional) self.error("no se puede crear un pack noexistente") }
}
class PackNacional inherits PackDeViaje {
    const listaDeActividades = []
    method provinciaDestino(actividad) { listaDeActividades.add(actividad) }
}
class PackInternacional inherits PackDeViaje {
    const paisDeDestino
    const cantidadDeEscalas
    const esLugarDeInteres
    method paisDeDestino() { return paisDeDestino }
    method cantidadDeEscalas() { return cantidadDeEscalas }
    method esLugarDeInteres() { return esLugarDeInteres }
}
class Coordinador {
    const cantidadDeViajes
    const estaMotivado
    const aniosDeExperiencia
    var rol //puede ser guia, asistente logistico, o acompañante
    const rol = ["Guia", "Asistente logistico", "Acompañante"]
    method cambiarRol(rolNuevo) {
        if (rolNuevo not "guia" or "Asistente logistico" or "Acompañante") self.error("No existe ese rol")
        else rol = rolNuevo
    }
}
class BeneficioEspecial {
    const tipo = ["Traslados privados", "Accesos a salas VIP", "Seguros adicionales"]
    const costo
    const estaVigente
    method costo() { return costo }
    method estaVigente() { return estaVigente }
}