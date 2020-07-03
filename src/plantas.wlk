import parcelas.*

class Planta {
	var property anioDeObtencionDeSemilla
	var property altura
	
	method horasDeSolQueTolera() {
	 	return 7
	 }
	 method esFuerte() {
	 	return self.horasDeSolQueTolera() > 9
	 }
	 method daNuevasSemillas() {
	 	return self.esFuerte() 
	 }
	 method espacioQueOcupa()
	 method leResultaIdeal(unaParcela)
	 
	
}

class Menta inherits Planta {
	override method espacioQueOcupa() {
		return altura * 3
	}
	override method daNuevasSemillas() {
	 	return super() or self.espacioQueOcupa() > 1
	}
	override method leResultaIdeal(unaParcela) {
		return unaParcela.superficieDeParcela() > 6
	}
}

class Soja inherits Planta {
	override method horasDeSolQueTolera() {
		if (altura < 0.5) {
			return 6
		}
		else if (altura.between(0.5, 1)) {
			return 8
		}
		else {
			return 12
		}
	}
	/*Método adicional*/
	method aptaAdicionalParaDarSemillas() {
		return anioDeObtencionDeSemilla > 2007 and altura.between(0.75, 0.9)
	}
	override method daNuevasSemillas() {
	 	return super() or self.aptaAdicionalParaDarSemillas()
	}
	override method espacioQueOcupa() {
		return altura / 2
	}
	override method leResultaIdeal(unaParcela) {
		return self.horasDeSolQueTolera() == unaParcela.horasDeSolPorDia()
	}
	
}

class Quinoa inherits Planta {
	var property valorDeEspacioQueOcupa = 0
	
	override method espacioQueOcupa() {
		return valorDeEspacioQueOcupa
	}
	override method horasDeSolQueTolera() {
		if (self.espacioQueOcupa() < 0.3) {
			return 10
		}
		else {
			return self.espacioQueOcupa()
		} 
	}
	override method daNuevasSemillas() {
	 	return super() or anioDeObtencionDeSemilla < 2005
	}
	override method leResultaIdeal(unaParcela) {
		return unaParcela.plantasQueTiene().all({ plant => plant.altura() < 1.5 })
	}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() {
		return false
	}
	override method leResultaIdeal(unaParcela) {
		return unaParcela.cantidadDePlantas() <= 1
	}
}

class MentaPeperina inherits Menta {
	override method espacioQueOcupa() {
		return super() * 2
	}
}












