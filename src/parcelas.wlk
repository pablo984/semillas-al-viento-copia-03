import plantas.*


class Parcela {
	var property ancho = 0
	var property largo = 0
	var property horasDeSolPorDia = 0
	const property plantasQueTiene = []
	
	method agregarPlanta(unaPlanta) {
		plantasQueTiene.add(unaPlanta)
	}
	method cantidadDePlantasBienAsociadas() {
		return plantasQueTiene.count({ plan => plan.leResultaIdeal(self) })
	}	
	method seAsociaBien(unaPlanta)	
		
	method superficieDeParcela() {
		return ancho * largo
	}
	method cantidadMaxDePlantasQueTolera() {
		if (ancho > largo) {
			return self.superficieDeParcela() / 5
		}
		else {
			return self.superficieDeParcela() / 3 + largo
		}
	}
	method tieneSangreJoven() {
		return plantasQueTiene.any({ plan => plan.anioDeObtencionDeSemilla() > 2012 })
	}
	/*Método adicional*/
	method cantidadDePlantas() {
		return plantasQueTiene.size()
	}
	/*Método adicional*/
	method diferenciaDeHorasCon(unaPlanta) {
		return (self.horasDeSolPorDia() - unaPlanta.horasDeSolQueTolera()).abs()
	}
	method plantar(unaPlanta) {
		if (self.cantidadDePlantas() < self.cantidadMaxDePlantasQueTolera() or 
			  self.diferenciaDeHorasCon(unaPlanta) < 2) {
			 	self.agregarPlanta(unaPlanta)
			 }
		else {
			console.println("No cumple la condición")
		}		
	}
	/*Método adicional*/
	method esIdealPara(unaPlanta) {
		return unaPlanta.leResultaIdeal(self)
	}
		
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(unaPlanta) {
		return self.tieneSangreJoven() and self.esIdealPara(unaPlanta)
	}
	
}

class ParcelaIndustrial inherits Parcela {
	 override method seAsociaBien(unaPlanta) {
		return self.cantidadDePlantas() <= 2 and unaPlanta.esFuerte()
	}
}
