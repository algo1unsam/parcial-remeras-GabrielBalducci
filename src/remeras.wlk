import empresas.*

class Remera {
	var property color = "blanca"
	var property talle = 40
	var property precioTalleMenor = 80
	var property precioTalleMayor = 100
	
	method precioTalle(){
		if (talle < 41) return precioTalleMenor
		else return precioTalleMayor
		}
	method precioColor(){
		if (color == "blanca" or color == "negra" or color == "gris") return 1
		else return 1.1
	}
	method precioBase() = self.precioTalle()*self.precioColor()
}

class RemeraLisa inherits Remera {
	
	method precio() = self.precioBase()
	
	method descuento() = 0.1
}

class RemeraBordada inherits Remera{
	var property cantidadColores = 1
	
	method precio() = self.precioBase()+cantidadColores*10
	
	method descuento() = 0
}

class RemeraSublimada inherits Remera{
	var property alto = 5
	var property ancho = 5
	var property empresaDibujo
	var property empresa
	
	method precioSublimado() = alto*ancho*0.5+empresaDibujo.precioDerechos()
	
	method precio() = self.precioBase()+self.precioSublimado()
	
	method descuento(){
		if (empresa.convenio(empresaDibujo)) return 0.2
		else return 0 
	}
}