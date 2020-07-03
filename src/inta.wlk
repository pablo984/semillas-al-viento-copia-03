import plantas.*
import parcelas.*

object inta {
	const property parcelas = []
	
	method agregarParcela(unaParcela) {
		parcelas.add(unaParcela)
	}
	/*Método adicional*/
	method cantidadDeParcelas() {
		return parcelas.size()
	}
	method promedioDePlantas() {
		return parcelas.sum({ par => par.cantidadDePlantas() }) / self.cantidadDeParcelas()
	}
	method parcelaMasAutosustentable() {
		return parcelas.filter({ par => par.cantidadDePlantas() > 4 }).max
										({ par => par.cantidadDePlantasBienAsociadas()})
	}
}
