import 'package:flutter/material.dart';
import '../services/categories_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CategoriesService().getList(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading...'),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...snapshot.data.items.map((cat) {
                    return Text(cat.name);
                  })
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
