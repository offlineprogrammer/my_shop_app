import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_shop_app/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavoriateStatus() async {
    final oldStatus = isFavorite;
    final url =
        'https://fluttershopapp-7392f-default-rtdb.firebaseio.com/products/$id.json';

    try {
      isFavorite = !isFavorite;

      final response = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
        throw HttpException('Could not delete');
      }
    } catch (error) {
      isFavorite = oldStatus;
    }
    notifyListeners();
  }
}
