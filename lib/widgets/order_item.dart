import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem orderItem;

  const OrderItem({Key key, this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${orderItem.amount}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(orderItem.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
