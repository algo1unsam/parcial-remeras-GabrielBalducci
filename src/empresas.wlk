import pedidos.*

class Marca {
	var property derechos = true
	var property precioDerechos = 0
}

class Empresa{
	var property sucursales = []
	var property pedidos = []
	var property convenios = []
	var property talles = (32..48)
	
	method registrarPedido(numeroPedido) {pedidos.add (numeroPedido)} 
	
	method convenio(marca) = return convenios.contains(marca)
		
	method filtroPedidosSucursal(sucursal) = pedidos.filter{pedido => pedido.sucursal() == sucursal}
	
	method totalFacturado() = sucursales.sum {sucursal => sucursal.totalFacturado()}
	
	method sucursalQueMasFacturo() = sucursales.max{sucursal => sucursal.totalFacturado()}
	
	method pedidosDeColor(color) = pedidos.remeras().sum{remeras => remeras.color()== color}	
	
	method pedidoMasCaro() = pedidos.max{pedido => pedido.precioTotal()}
	
	method sucursalesQueVendieronTalles() = sucursales.filter{sucursal => sucursal.vendioTalles()}
	
	}

class Sucursal{
	var property cantidadMinDescuento = 20
	var property empresa
	
	
	method totalFacturado() = empresa.filtroPedidosSucursal(self).sum {pedido => pedido.precioTotal()}
	
	method tallesVendidos() = empresa.filtroPedidosSucursal(self).map{pedido => pedido.remeras().talle()}.asSet()
	
	//metodo 1: comparar con todos los talles
	method tallesVendidosOrdenados() = self.tallesVendidos().sortedBy{ a,b => a<b}
	method VendioTalles() = self.tallesVendidosOrdenados() == empresa.talles()
	
	//metodo 2: la cantidad de talles diferentes vendidos = la cantidad de talles disponibles
	//method VendioTalles() = self.tallesVendidos().size() == empresa.cantidadTalles()
}