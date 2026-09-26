import 'package:flutter/material.dart';
import 'carrito.dart';

class ProductoScreen extends StatelessWidget {
  final String nombre;
  final String detalle;
  final String precio;
  final List<Map<String, String>> carrito;
  final Function(Map<String, String>) onAgregarAlCarrito;

  const ProductoScreen({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.precio,
    required this.carrito,
    required this.onAgregarAlCarrito,
  });

  @override
  Widget build(BuildContext context) {
    const Color verde = Color(0xFF167A5A);
    const Color fondo = Color(0xFFFFFCF7);
    const Color borde = Color(0xFFE9E5DE);
    const Color textoSuave = Color(0xFF66706C);

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarritoScreen(carrito: carrito),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7EA),
                border: Border.all(color: borde),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 80,
                  color: verde,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              detalle,
              style: const TextStyle(
                fontSize: 14,
                color: textoSuave,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              precio,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: verde,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borde),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Producto disponible en varias tiendas cercanas. Puedes agregarlo al carrito para comparar dónde te sale mejor el mercado completo.',
                    style: TextStyle(
                      fontSize: 13,
                      color: textoSuave,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final producto = {
                    'nombre': nombre,
                    'detalle': detalle,
                    'precio': precio,
                  };

                  onAgregarAlCarrito(producto);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarritoScreen(carrito: carrito),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: verde,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Agregar al carrito',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: borde),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Volver',
                  style: TextStyle(
                    color: verde,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}