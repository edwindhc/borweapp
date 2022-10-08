import 'package:borweapp/pages/home_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen()
};
