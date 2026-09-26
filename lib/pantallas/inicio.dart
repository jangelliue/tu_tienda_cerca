import 'package:flutter/material.dart';
import 'package:tu_tienda_cerca/pantallas/mercado.dart';
import 'package:tu_tienda_cerca/pantallas/carrito.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int indiceActual = 0;

  @override
  Widget build(BuildContext context) {
    const Color verde = Color(0xFF167A5A);
    const Color fondo = Color(0xFFFFFCF7);
    const Color borde = Color(0xFFE9E5DE);
    const Color textoSuave = Color(0xFF66706C);

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Tu tienda cerca'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hola, José',
              style: TextStyle(
                fontSize: 14,
                color: textoSuave,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Encuentra productos y tiendas cercanas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            _buildTarjetaPrincipal(
              icono: Icons.shopping_basket_outlined,
              titulo: 'Arma tu mercado',
              subtitulo: 'Agrega productos y encuentra la mejor tienda',
              enlace: 'Empezar >',
              colorFondo: const Color(0xFFFFF7EA),
              colorIcono: verde,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MercadoScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            _buildTarjetaPrincipal(
              icono: Icons.storefront_outlined,
              titulo: 'Elige tu tienda de confianza',
              subtitulo: 'Compra directo en tu tienda favorita',
              enlace: 'Ver tiendas >',
              colorFondo: Colors.white,
              colorIcono: verde,
              onPressed: () {},
            ),
            const SizedBox(height: 18),
            const Text(
              'Tiendas cercanas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildTiendaCercana(
              nombre: 'Supermercado La Esquina',
              detalle: '450 m · Abierta hasta 9:00 p. m.',
              extra: 'Domicilio desde 3.000',
              verde: verde,
              borde: borde,
            ),
            const SizedBox(height: 10),
            _buildTiendaCercana(
              nombre: 'Mini Súper Don Carlos',
              detalle: '700 m · Abierta hasta 8:30 p. m.',
              extra: 'Ver catálogo disponible',
              verde: verde,
              borde: borde,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceActual,
        selectedItemColor: verde,
        unselectedItemColor: Colors.grey,
        onTap: (indice) {
          setState(() {
            indiceActual = indice;
          });

          if (indice == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CarritoScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
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
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorFondo,
          foregroundColor: Colors.black87,
          elevation: 0,
          padding: const EdgeInsets.all(14),
          side: const BorderSide(color: Color(0xFFE9E5DE)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.centerLeft,
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
      ),
    );
  }

  Widget _buildTiendaCercana({
    required String nombre,
    required String detalle,
    required String extra,
    required Color verde,
    required Color borde,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borde),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F3ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.storefront_outlined,
              color: verde,
            ),
          ),
          const SizedBox(width: 12),
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
                    color: textoSuave,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  extra,
                  style: TextStyle(
                    fontSize: 12,
                    color: verde,
                    fontWeight: FontWeight.w600,
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