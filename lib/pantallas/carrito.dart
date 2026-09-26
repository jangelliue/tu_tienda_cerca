import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color verde = Color(0xFF167A5A);
    const Color fondo = Color(0xFFFFFCF7);
    const Color borde = Color(0xFFE9E5DE);
    const Color textoSuave = Color(0xFF66706C);

    final List<Map<String, String>> carrito = [
      {'nombre': 'Arroz Buen Grano', 'detalle': '500 g', 'precio': '₡3.200'},
      {'nombre': 'Frijoles Don Pedro', 'detalle': '900 g', 'precio': '₡2.650'},
      {'nombre': 'Aceite Mazorca', 'detalle': '1 L', 'precio': '₡4.500'},
    ];

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(title: const Text('Carrito')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: carrito.length,
                itemBuilder: (context, index) {
                  final producto = carrito[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borde),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF7EA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: verde,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto['nombre']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                producto['detalle']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: textoSuave,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          producto['precio']!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: verde,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borde),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(fontSize: 14, color: textoSuave),
                      ),
                      Text(
                        '₡10.350',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Entrega estimada',
                        style: TextStyle(fontSize: 14, color: textoSuave),
                      ),
                      Text(
                        'Hoy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: verde,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continuar compra',
                  style: TextStyle(
                    color: Colors.white,
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
