class PackDeViaje {
    const duracionEnDias
    const precioBase
    const beneficiosEspeciales
    const coordinadorACargo
    method duracionEnDias() { return duracionEnDias }
    method precioBase() { return precioBase }
    method beneficiosEspeciales() { return beneficiosEspeciales }
    method coordinadorACargo() { return coordinadorACargo }
}
class PackNacional inherits PackDeViaje {
    const listaDeActividades = []
    method provinciaDestino(actividad) { listaDeActividades.add(actividad) }
}
class PackInternacional inherits PackDeViaje {
    const esLugarDeInteres
    method paisDeDestino(pais) { return pais }
    
}