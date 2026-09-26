import 'package:flutter/material.dart';
//import 'producto.dart';

class MercadoScreen extends StatelessWidget {
  const MercadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color verde = Color(0xFF167A5A);
    const Color fondo = Color(0xFFFFFCF7);
    const Color borde = Color(0xFFE9E5DE);
    const Color textoSuave = Color(0xFF66706C);

    final List<Map<String, String>> productos = [
      {
        'nombre': 'Arroz Buen Grano',
        'detalle': '500 g · 3 tiendas',
        'precio': '₡3.200',
      },
      {
        'nombre': 'Arroz La Cosecha',
        'detalle': '500 g · 4 tiendas',
        'precio': '₡3.050',
      },
      {
        'nombre': 'Arroz Campo Claro',
        'detalle': '500 g · 2 tiendas',
        'precio': '₡2.950',
      },
      {
        'nombre': 'Arroz Dorado',
        'detalle': '1 kg · 2 tiendas',
        'precio': '₡5.700',
      },
    ];

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Arma tu mercado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'arroz',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFiltro('Todos', true),
                  _buildFiltro('Granos', false),
                  _buildFiltro('Bebidas', false),
                  _buildFiltro('Aseo', false),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Agrega productos y encontraremos la mejor tienda.',
              style: TextStyle(
                fontSize: 13,
                color: textoSuave,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Resultados para arroz',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: productos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.88,
                ),
                itemBuilder: (context, index) {
                  final producto = productos[index];

                  return GestureDetector(
                    onTap: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductoScreen(
                            nombre: producto['nombre']!,
                            detalle: producto['detalle']!,
                            precio: producto['precio']!,
                          ),
                        ),
                      );*/
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borde),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7EA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 42,
                                  color: verde,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            producto['nombre']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            producto['detalle']!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: textoSuave,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                producto['precio']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 28,
                                height: 28,
                                child: ElevatedButton(
                                  onPressed: () {
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductoScreen(
                                          nombre: producto['nombre']!,
                                          detalle: producto['detalle']!,
                                          precio: producto['precio']!,
                                        ),
                                      ),
                                    );*/
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: verde,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: verde,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '3 productos agregados',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ver carrito',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFiltro(String texto, bool activo) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: activo ? const Color(0xFFE7F3ED) : Colors.white,
        border: Border.all(
          color: activo ? const Color(0xFFE7F3ED) : const Color(0xFFE9E5DE),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 12,
          color: activo ? const Color(0xFF167A5A) : Colors.black87,
          fontWeight: activo ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}