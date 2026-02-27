# Base de datos `naan_bbdd`

## AUDITORIA
- Se actualiza automáticamente al registrar cambios en **Pedido**, **Producto** o **Categoría**.
- Sus registros se eliminan automáticamente cada **1 año** mediante un evento programado.
- Almacena: tabla afectada, id del registro, operación (`INSERT`, `UPDATE`, `DELETE`), datos anteriores, datos nuevos y fecha.
- **Importante:** sirve para trazabilidad y control de cambios.

## Usuario
- Contiene los datos de cada usuario, incluyendo **rol** (cliente/admin).
- Se utiliza para permisos y asociaciones con otras tablas.

## Metodo_Pago
- Métodos de pago asociados a un cliente.
- Solo un método por usuario puede ser **predeterminado** (`es_predeterminado = TRUE`).
- **Trigger automático:** cuando se marca un método como predeterminado, todos los demás métodos del mismo usuario pasan a `FALSE`.

## Dirección
- Direcciones de envío asociadas a un usuario.
- FK hacia `Usuario`.
- Permite múltiples direcciones por usuario.

## Avatar_3D
- Datos sobre el avatar 3D asociado a un usuario: pecho, cintura, cadera, estatura, peso, edad, talla.
- FK hacia `Usuario`.  
- No es unique, por si se decide permitir cambiar el avatar en el futuro, aunque la política actual permite **uno por usuario**.

## Producto
- Productos disponibles en la tienda.
- **Soft delete:** no se pueden eliminar directamente; se marcan como inactivos (`activo = FALSE`).
- Productos inactivos se eliminan automáticamente tras **3 años**.
- `eliminado_en`:
  - Se guarda como `NULL` por defecto.
  - **Trigger automático:** actualiza la fecha cuando se desactiva, y vuelve a `NULL` si se reactiva.
- FK hacia `Categoria`.

## Categoría
- Categorías de productos.
- Asociadas a productos para organización y filtrado.

## Favorito
- Productos favoritos por usuario.
- **Doble clave primaria:** `id_usuario` + `id_producto`.
- FK hacia `Usuario` y `Producto`.

## Carrito
- Carrito asociado a un usuario (**uno por cuenta**).
- `total` calculado automáticamente sumando los productos en `detalle_carrito`.
- **Importante:** para resetear el carrito tras un pedido, se deben eliminar los productos de `detalle_carrito`.

## Detalle_Carrito
- Productos individuales del carrito con cantidad y precio unitario.
- FK hacia `Carrito` y `Producto`.

## Pedido
- Almacena todos los datos de un pedido.
- `total` calculado automáticamente sumando los productos de `detalle_pedido`.
- **Nota:** el total **no incluye gastos de envío**.
- FK hacia `Usuario`, `Metodo_Pago` y `Direccion`.

## Detalle_Pedido
- Productos individuales de cada pedido.
- FK hacia `Pedido` y `Producto`.

## Historial_Estado_Pedido
- Almacena los cambios de estado de cada pedido junto con la fecha.
- Permite trazabilidad de los pedidos.
- FK hacia `Pedido`.

---

## Puntos importantes extra
- Los datos que se buscan con frecuencia están **indexados**.
- Hay dos usuarios con permisos en la base de datos:
  - `nadmin` → administrador, gestiona todo.
  - `naan_user` → cliente, acceso limitado para la web.
- Se utilizan triggers y eventos para:
  - Actualizar totales de carrito y pedido.
  - Mantener auditoría y control de métodos de pago predeterminados.
  - Gestionar soft delete y eliminación automática de productos inactivos.
