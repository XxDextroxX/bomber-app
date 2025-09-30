import 'package:bomber_app/models/box_model.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetBox extends StatelessWidget {
  const WidgetBox({super.key, required this.data});
  final List<DataBox> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_viewBox(), _viewItemsBox()]),
    );
  }

  Widget _viewBox() {
    final box = data.first;
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return WidgetCardGeneral(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Información del lote:', style: const TextStyle(fontSize: 18)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.qr_code, color: Colors.blue),
            title: Text(
              'Código: ${box.code}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.inventory, color: Colors.green),
            title: Text('Lote: ${box.nameLote}'),
          ),
          ListTile(
            leading: const Icon(Icons.warehouse, color: Colors.orange),
            title: Text('Warehouse: ${box.nameAlmacen}'),
          ),
          ListTile(
            leading: const Icon(Icons.note, color: Colors.grey),
            title: Text('Observations: ${box.observacionesLote}'),
          ),
          ListTile(
            leading: const Icon(Icons.scale, color: Colors.purple),
            title: Text('Peso: ${box.pesoLote} g'),
          ),
          ListTile(
            leading: const Icon(Icons.label, color: Colors.red),
            title: Text('Referencia: ${box.referenceLote}'),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens, color: Colors.teal),
            title: Text('Color: ${box.colorLote}'),
            trailing: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(
                  int.parse(box.colorLote.replaceFirst('#', '0xff')),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.date_range, color: Colors.blueGrey),
            title: Text(
              'Creado: ${box.fechaCreacionLote.isNotEmpty ? dateFormat.format(DateTime.parse(box.fechaCreacionLote)) : 'N/A'}',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.height, color: Colors.brown),
            title: Text(
              'Altura: ${box.alturaLote != 0.0 ? box.alturaLote : 'N/A'}',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.width_normal, color: Colors.brown),
            title: Text(
              'Peso: ${box.anchoLote != 0.0 ? box.anchoLote : 'N/A'}',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.money, color: Colors.green),
            title: Text('Costo: ${box.cost}'),
          ),
        ],
      ),
    );
  }

  Widget _viewItemsBox() {
    return WidgetCardGeneral(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              'Productos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: item.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget:
                              (context, url, error) =>
                                  const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Item details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.production_quantity_limits,
                                color: Colors.blue,
                              ),
                              title: Text('Código: ${item.productCode}'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.inventory_2,
                                color: Colors.green,
                              ),
                              title: Text('Stock: ${item.lotProductStock}'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.category,
                                color: Colors.orange,
                              ),
                              title: Text('Variante: ${item.variantName}'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.title,
                                color: Colors.grey,
                              ),
                              title: Text(
                                'Variante Titulo: ${item.variantTitle}',
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.store,
                                color: Colors.purple,
                              ),
                              title: Text('Warehouse ID: ${item.warehouseId}'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.price_check,
                                color: Colors.teal,
                              ),
                              title: Text('Precio: ${item.price}'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
