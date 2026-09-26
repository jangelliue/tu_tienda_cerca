import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color verde = Color(0xFF167A5A);
    const Color verdeClaro = Color(0xFFE7F3ED);
    const Color fondo = Color(0xFFFFFCF7);
    const Color borde = Color(0xFFE9E5DE);
    const Color textoSuave = Color(0xFF66706C);

    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hola, Ana',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '¿Qué necesitas hoy?',
                style: TextStyle(
                  fontSize: 14,
                  color: textoSuave,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borde),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Busca arroz, leche, una marca o una tienda',
                    hintStyle: TextStyle(fontSize: 13, color: textoSuave),
                    prefixIcon: Icon(Icons.search, color: textoSuave),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTarjetaPrincipal(
                icono: Icons.shopping_basket_outlined,
                titulo: 'Arma tu mercado',
                subtitulo: 'Agrega productos y encuentra la mejor tienda',
                enlace: 'Empezar >',
                colorFondo: const Color(0xFFFFF7EA),
                colorIcono: verde,
              ),
              const SizedBox(height: 10),
              _buildTarjetaPrincipal(
                icono: Icons.storefront_outlined,
                titulo: 'Elige tu tienda de confianza',
                subtitulo: 'Compra directo en tu tienda favorita',
                enlace: 'Ver tiendas >',
                colorFondo: Colors.white,
                colorIcono: verde,
              ),
              const SizedBox(height: 18),
              const Text(
                'Compra por categoría',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip('Granos'),
                    _buildChip('Lácteos'),
                    _buildChip('Bebidas'),
                    _buildChip('Aseo'),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Tiendas cerca de ti',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildTienda(
                nombre: 'Tienda La Esquina',
                detalle: '450 m · Abierta hasta 9:00 p. m.',
                extra: 'Domicilio desde 3.000',
                verde: verde,
                verdeClaro: verdeClaro,
                borde: borde,
              ),
              const SizedBox(height: 10),
              _buildTienda(
                nombre: 'Mercadito San José',
                detalle: '700 m · Abierta hasta 8:30 p. m.',
                extra: 'Ver catálogo disponible',
                verde: verde,
                verdeClaro: verdeClaro,
                borde: borde,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: verde,
        unselectedItemColor: textoSuave,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildTarjetaPrincipal({
    required IconData icono,
    required String titulo,
    required String subtitulo,
    required String enlace,
    required Color colorFondo,
    required Color colorIcono,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorFondo,
        border: Border.all(color: const Color(0xFFE9E5DE)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F3ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icono, color: colorIcono),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitulo,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF66706C),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  enlace,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF167A5A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String texto) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9E5DE)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildTienda({
    required String nombre,
    required String detalle,
    required String extra,
    required Color verde,
    required Color verdeClaro,
    required Color borde,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borde),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7EA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.storefront, color: verde),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detalle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF66706C),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  extra,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: verde,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}