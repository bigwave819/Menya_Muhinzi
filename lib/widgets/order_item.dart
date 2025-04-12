import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:secondapp/models/order.dart';
import 'package:secondapp/widgets/order_product.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = order.products.fold(0.0, (acc, e) => acc + e.price);
    final products = order.products.take(2).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      elevation: 0.1,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "order: ${order.id}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${order.products.length} items",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 5),
                Text("frw: ${totalPrice.toStringAsFixed(2)}"),
              ],
            ),
            const SizedBox(height: 20),
            ...List.generate(products.length, (index) {
              return OrderProduct(product: products[index], order: order);
            }),
            if (order.products.length > 1) const SizedBox(height: 10),
            if (order.products.length > 2)
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: EdgeInsets.all(16),
                        child: ListView.builder(
                          itemCount: order.products.length,
                          itemBuilder: (context, index) {
                            final product = order.products[index];
                            return OrderProduct(order: order, product: product);
                          },
                        ),
                      );
                    },
                  );
                },
                label: Text("View all"),
                icon: Icon(IconlyBold.arrowRight),
              ),
          ],
        ),
      ),
    );
  }
}
