# Especificaciones del proyecto: Tu Tienda Cerca

## Integrantes del equipo: José Angel Lopez y Ana María Ávila Suarez

## Problema

Hoy, los tenderos de barrio enfrentan competencia de cadenas como D1, Ara, Ísimo y Oxxo, que tienen mayor capacidad de expansión y presencia comercial. Aunque las tiendas de barrio ofrecen cercanía, atención personalizada y facilidad para compras pequeñas, muchas no cuentan con canales digitales que permitan a los clientes conocer sus productos y realizar pedidos sin desplazarse.

Por su parte, un cliente que necesita productos cotidianos debe ir a una o varias tiendas para consultar disponibilidad, llamar o escribir por mensajes, o comprar en grandes superficies. No existe una forma centralizada de buscar productos entre tiendas cercanas, conocer cuáles pueden atender una lista de mercado y realizar un pedido desde el celular.

## Stakeholders

- **Cliente:** necesita encontrar y pedir productos de tiendas cercanas.
- **Tendero:** busca mayor visibilidad y oportunidades de venta frente a las grandes cadenas.
- **Domiciliario:** podría realizar las entregas en una versión futura.
- **Comunidad del barrio:** se beneficia de una alternativa que fortalece el comercio local.

## Actores

- **Cliente:** consulta tiendas y productos, crea pedidos y selecciona una modalidad de entrega.
- **Servicio de notificaciones:** informa cambios en el estado del pedido.

Los tenderos y domiciliarios se representan mediante datos simulados, por lo que no interactúan directamente con el MVP.

## Objetivo y métricas de éxito

**Objetivo:** permitir que un cliente encuentre, entre tres y cinco tiendas de barrio simuladas, una tienda que cubra todos o la mayor cantidad posible de productos de su lista y complete un pedido simulado en menos de 3 minutos.

| Métrica | Situación actual | Meta |
|---|---|---|
| Encontrar productos | El cliente debe desplazarse, llamar o escribir a varias tiendas. | Consultar las tiendas que pueden atender su lista desde la app en menos de 3 minutos. |
| Elegir tienda | El cliente no conoce qué tienda tiene todos los productos antes de ir. | Mostrar tiendas ordenadas por cantidad de productos disponibles, distancia y domicilio estimado. |
| Confirmar pedido | No hay un proceso digital organizado. | Crear un pedido simulado con validación de disponibilidad. |

## Restricciones

- **Datos simulados:** las tiendas, catálogos, disponibilidades y estados de pedido se cargarán previamente; no se conectarán a negocios reales.
- **Pagos:** el checkout será simulado, sin pagos ni datos financieros.
- **Logística:** no habrá geolocalización en tiempo real, seguimiento GPS ni asignación real de domiciliarios.
- **Pedido único:** cada pedido se realizará en una sola tienda; no se dividirá una compra entre varias tiendas.

## Alcance

La primera versión se desarrolla únicamente para el cliente. Las acciones de tiendas y domiciliarios se representarán mediante datos precargados y cambios controlados dentro de la aplicación.

### Incluye

- Consulta de tres a cinco tiendas simuladas, sus catálogos y productos.
- Ruta **“Elige tu tienda de confianza”** para consultar una tienda específica y comprar desde su catálogo.
- Ruta **“Arma tu mercado”** para agregar productos desde un catálogo general sin escoger una tienda desde el inicio.
- Carrito que identifica las tiendas que tienen todos o la mayor cantidad de productos solicitados.
- Selección de una tienda, validación de disponibilidad y checkout simulado.
- Domicilio, recogida inmediata o recogida programada mediante franjas predefinidas.
- Seguimiento e historial de pedidos simulados.

### No incluye

- Aplicación o panel para tenderos y domiciliarios.
- Pagos reales, facturación o integración con sistemas de las tiendas.
- Logística real: asignación de repartidores, rutas, GPS y agrupación de pedidos.
- Pedidos divididos entre varias tiendas, chat, integración con WhatsApp, cupones o programas de fidelización.

## Conceptos del dominio

| Concepto | Definición |
|---|---|
| **Cliente** | Persona que busca productos y realiza pedidos desde la app. |
| **Tienda de barrio** | Comercio local simulado que ofrece productos y horarios de atención. |
| **Producto** | Artículo ofrecido por una o más tiendas, con precio y disponibilidad. |
| **Categoría** | Grupo general de productos, como granos, bebidas, aseo o snacks. |
| **Marca** | Identificación comercial de un producto, por ejemplo Diana, Roa o Colgate. |
| **Catálogo general** | Vista que reúne productos disponibles en las tiendas simuladas. |
| **Carrito** | Lista de productos que el cliente desea comprar antes de elegir una tienda. |
| **Tienda candidata** | Tienda que tiene todos o parte de los productos incluidos en el carrito. |
| **Coincidencia** | Cantidad de productos del carrito que una tienda tiene disponibles. |
| **Producto sustituto** | Alternativa de la misma categoría o subcategoría cuando el producto solicitado no está disponible. |
| **Pedido** | Solicitud final de productos realizada a una única tienda. |
| **Modalidad de entrega** | Domicilio, recogida cuando esté listo o recogida programada. |

Un cliente puede agregar productos desde el catálogo general o desde una tienda específica. Antes de confirmar, debe seleccionar una sola tienda y la aplicación valida nuevamente la disponibilidad.

## Reglas de negocio

- **RN-01.** Un pedido solo puede confirmarse si el carrito contiene al menos un producto.
- **RN-02.** La búsqueda debe mostrar productos relacionados con el término ingresado por nombre, marca o categoría.
- **RN-03.** Al agregar productos desde el catálogo general, la aplicación debe calcular las tiendas candidatas según los productos disponibles.
- **RN-04.** Las tiendas que tienen todos los productos del carrito deben mostrarse antes que las tiendas con coincidencia parcial.
- **RN-05.** Si ninguna tienda tiene todos los productos, la aplicación debe mostrar las opciones con mayor coincidencia e indicar los productos faltantes.
- **RN-06.** Cada pedido solo puede confirmarse con productos de una única tienda.
- **RN-07.** Antes de confirmar el pedido, la aplicación debe validar nuevamente la disponibilidad de todos los productos en la tienda seleccionada.
- **RN-08.** Si un producto no está disponible, el cliente debe poder eliminarlo, ajustar su cantidad o sustituirlo por una alternativa disponible de la misma categoría.
- **RN-09.** Después de sustituir o eliminar un producto, la aplicación debe recalcular las tiendas candidatas.
- **RN-10.** La recogida programada solo puede seleccionarse en franjas futuras dentro del horario de atención de la tienda.

## Historias de usuario

- **HU-01.** Como cliente, quiero consultar las tiendas cercanas y sus catálogos, para elegir mi tienda de confianza.
- **HU-02.** Como cliente, quiero buscar productos por nombre, marca o categoría, para encontrar el artículo que necesito y opciones similares.
- **HU-03.** Como cliente, quiero agregar productos desde un catálogo general, para armar mi mercado sin escoger una tienda desde el inicio.
- **HU-04.** Como cliente, quiero ver qué tiendas tienen todos o la mayor cantidad de productos de mi carrito, para elegir la opción más conveniente.
- **HU-05.** Como cliente, quiero consultar la distancia y el domicilio estimado de cada tienda candidata, para decidir dónde realizar el pedido.
- **HU-06.** Como cliente, quiero sustituir un producto no disponible por una alternativa similar, para completar mi compra sin empezar de nuevo.
- **HU-07.** Como cliente, quiero validar la disponibilidad antes de confirmar, para conocer si los productos siguen disponibles.
- **HU-08.** Como cliente, quiero elegir domicilio, recogida inmediata o recogida programada, para recibir el pedido de acuerdo con mi tiempo.
- **HU-09.** Como cliente, quiero consultar el estado y el historial de mis pedidos, para hacer seguimiento a mis compras.

## Casos de uso

### CU-01. Armar mi mercado por productos

**Actor:** Cliente.

**Precondición:** El cliente tiene acceso al catálogo general y existen tiendas simuladas con productos cargados.

**Flujo principal:**

1. El cliente busca o selecciona productos por nombre, marca o categoría.
2. La aplicación muestra el producto exacto y otras opciones relacionadas.
3. El cliente agrega uno o varios productos al carrito.
4. La aplicación actualiza las tiendas candidatas según la disponibilidad de cada producto.
5. El cliente ingresa al carrito.
6. La aplicación muestra las tiendas que tienen todos los productos o la mayor coincidencia.
7. El cliente revisa la distancia y el domicilio estimado.
8. El cliente selecciona una tienda para continuar con el pedido.

**Excepción:** si ninguna tienda tiene todos los productos, la aplicación informa cuáles hacen falta y permite al cliente eliminarlos o sustituirlos por alternativas disponibles.

### CU-02. Comprar en una tienda de confianza

**Actor:** Cliente.

**Precondición:** El cliente tiene acceso a la lista de tiendas cercanas.

**Flujo principal:**

1. El cliente ingresa a la opción **“Elige tu tienda de confianza”**.
2. La aplicación muestra las tiendas cercanas simuladas.
3. El cliente selecciona una tienda.
4. La aplicación muestra el catálogo de la tienda.
5. El cliente agrega uno o varios productos al carrito.
6. El cliente consulta el carrito y continúa con el pedido.

**Excepción:** si la tienda no tiene productos disponibles, la aplicación informa la situación y permite volver a la lista de tiendas.

### CU-03. Confirmar pedido

**Actor:** Cliente.

**Precondición:** El cliente tiene productos en el carrito y seleccionó una tienda candidata o una tienda de confianza.

**Flujo principal:**

1. El cliente revisa el carrito y la tienda seleccionada.
2. La aplicación valida nuevamente la disponibilidad de los productos.
3. El cliente selecciona domicilio, recogida inmediata o recogida programada.
4. Si programa recogida, selecciona una franja futura disponible.
5. El cliente confirma el checkout simulado.
6. La aplicación muestra el pedido creado y su estado inicial.

**Excepción:** si un producto cambia a no disponible, la aplicación informa el cambio y permite eliminarlo, ajustar la cantidad o seleccionar un sustituto antes de confirmar.

## Flujo de pantallas

El flujo de pantallas y los mockups se elaborarán en Google Stitch. La aplicación tendrá dos rutas principales de compra:

```text
Login
  ↓
Inicio
  ├── Arma tu mercado
  │     ↓
  │   Catálogo general / Buscar producto
  │     ↓
  │   Detalle de producto
  │     ↓
  │   Carrito con tiendas candidatas
  │     ↓
  │   Selección de tienda
  │
  └── Elige tu tienda de confianza
        ↓
      Tiendas cercanas
        ↓
      Detalle de tienda y catálogo
        ↓
      Carrito con tienda preseleccionada

Carrito
  ↓
Validación de disponibilidad
  ↓
Modalidad de entrega o recogida
  ↓
Confirmación y seguimiento del pedido
```

## Propuestas de diseño y mockups

Los mockups se diseñarán en Google Stitch. La aplicación tendrá una apariencia sencilla, cercana y enfocada en compras cotidianas.

- **Color principal:** verde esmeralda `#167A5A`.
- **Color secundario:** crema cálido `#FFF7EA`.
- **Color de acento:** terracota `#D96C43`.
- **Fondo:** marfil `#FFFCF7`.
- **Texto principal:** carbón `#1C2523`.
- **Tipografía:** Inter.
- **Iconografía:** Material Symbols Rounded.

La pantalla de Inicio será el punto central de la aplicación. Mostrará un buscador con el texto: **“Busca arroz, leche, una marca o una tienda”**, productos y categorías destacadas, tiendas cercanas y los accesos visibles a **“Arma tu mercado”** y **“Elige tu tienda de confianza”**.