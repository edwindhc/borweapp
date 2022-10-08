import 'dart:convert';
import 'package:borweapp/models/products.dart';
import 'package:flutter/material.dart';
import 'api_methods.dart';

class ProductsService with ChangeNotifier {
  Future getList() async {
    final resp = await ApiMethods().get('wc/store/products');
    final products = Products.fromJsonList(jsonDecode(resp.body));
    return products;
  }

  Future getLastProducts({int limit = 10}) async {
    final resp = await ApiMethods()
        .get('wc/store/products?orderby=date&per_page=$limit');
    final products = Products.fromJsonList(jsonDecode(resp.body));
    return products;
  }
}
