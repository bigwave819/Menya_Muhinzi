import 'package:secondapp/data/products.dart';
import 'package:secondapp/models/order.dart';
import 'package:secondapp/utils/enum/orders.dart';

List<Order> orders = [
  Order(
    id: "1",
    products: products.reversed.take(3).toList(),
    orderDate: DateTime.utc(2025, 3, 1),
    deliveryDate: DateTime.utc(2025, 4, 1),
    status: OrderStatus.delivered,
  ),
  Order(
    id: "2",
    products: products.take(2).toList(),
    orderDate: DateTime.utc(2025, 3, 5),
    deliveryDate: DateTime.utc(2025, 4, 4),
    status: OrderStatus.processing,
  ),
  Order(
    id: "3",
    products: products.sublist(1, 4),
    orderDate: DateTime.utc(2025, 2, 20),
    deliveryDate: DateTime.utc(2025, 3, 25),
    status: OrderStatus.shipping,
  ),
  Order(
    id: "4",
    products: products.reversed.take(1).toList(),
    orderDate: DateTime.utc(2025, 3, 10),
    deliveryDate: DateTime.utc(2025, 4, 2),
    status: OrderStatus.delivered,
  ),
  Order(
    id: "5",
    products: products.sublist(0, 3),
    orderDate: DateTime.utc(2025, 2, 28),
    deliveryDate: DateTime.utc(2025, 3, 30),
    status: OrderStatus.picking,
  ),
  Order(
    id: "6",
    products: products.take(1).toList(),
    orderDate: DateTime.utc(2025, 3, 15),
    deliveryDate: DateTime.utc(2025, 4, 5),
    status: OrderStatus.processing,
  ),
  Order(
    id: "7",
    products: products.sublist(2, 5),
    orderDate: DateTime.utc(2025, 3, 18),
    deliveryDate: DateTime.utc(2025, 4, 8),
    status: OrderStatus.shipping,
  ),
];