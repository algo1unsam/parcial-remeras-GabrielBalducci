import remeras.*
import empresas.*

class Pedido {
	var property cantidadRemeras
	var property sucursal
	var property remeras
	var property precio = 100
	
	method actualizarPrecio(){precio=remeras.precio()}  
	
	method precio() = precio*cantidadRemeras
	
	method hayDescuento() = sucursal.cantidadMinDescuento() < cantidadRemeras
	
	method descuentoTotal(){
		if (self.hayDescuento()) return remeras.descuento() * self.precio()
		else return 0 
	}
	
	method precioFinal() = self.precio() - self.descuentoTotal()
	
}
