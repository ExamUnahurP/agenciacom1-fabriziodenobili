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
    const esLugarDeInteres
    method paisDeDestino(pais) { return pais }

}
class Coordinador {
    const cantidadDeViajes
    const estaMotivado
    const aniosDeExperiencia
    var rol //puede ser guia, asistente logistico, o acompañante
    method cambiarRol(rolNuevo) {
        if (rolNuevo not "guia" or "asistente logistico" or "acompañante") self.error("No existe ese rol") 
        else rol = rolNuevo
    }
}