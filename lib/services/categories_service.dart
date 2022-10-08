import 'dart:convert';
import 'package:borweapp/models/categories.dart';
import 'package:flutter/material.dart';
import 'api_methods.dart';

class CategoriesService with ChangeNotifier {
  Future getList() async {
    final resp = await ApiMethods().get('wc/store/products/categories');
    final categories = Categories.fromJsonList(jsonDecode(resp.body));
    return categories;
  }
}
