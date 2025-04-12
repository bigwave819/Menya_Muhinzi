import 'package:flutter/material.dart';
import 'package:secondapp/utils/enum/orders.dart';
import 'package:secondapp/data/orders.dart';
import 'package:secondapp/widgets/order_item.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text("My Orders"),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(tabs.length, (index) {
              return Tab(text: tabs[index]);
            }),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            final filteredOrders =
                orders
                    .where((order) => order.status == OrderStatus.values[index])
                    .toList();
            return ListView.separated(
              padding: EdgeInsets.all(18),
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return OrderItem(order: order);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: filteredOrders.length,
            );
          }),
        ),
      ),
    );
  }
}
