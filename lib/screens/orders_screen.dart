import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/orders.dart' show Orders;
import 'package:my_shop_app/widgets/app_drawrer.dart';
import 'package:my_shop_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
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
