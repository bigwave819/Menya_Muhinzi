import 'package:secondapp/models/product.dart';
import 'package:secondapp/utils/enum/orders.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final OrderStatus status;

  Order({
    required this.id,
    required this.products,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
  });
}
