import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/orders.dart' show Orders;
import 'package:my_shop_app/widgets/app_drawrer.dart';
import 'package:my_shop_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(
            orderItem: ordersData.orders[index],
          );
        },
      ),
    );
  }
}
