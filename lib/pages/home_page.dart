import 'package:borweapp/helpers/constans.dart';
import 'package:borweapp/services/products_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/categories_service.dart';
import '../widgets/search_form.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/Location.svg'),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Text(
              '15/2 New Texas',
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/Notification.svg'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "Best outfit for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const CategoriesWidget(),
            SectionTitle(title: "Lo nuevo", pressShowMore: () {}),
            FutureBuilder(
                future: ProductsService().getLastProducts(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text("Loading"),
                    );
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...snapshot.data.items.map((product) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: defaultPadding),
                              child: Container(
                                padding:
                                    const EdgeInsets.all(defaultPadding / 2),
                                width: 154,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFe7eff2),
                                          borderRadius: BorderRadius.circular(
                                              defaultBorderRadius)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: defaultPadding),
                                        child: Image.network(
                                          product.images[0].thumbnail,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultPadding,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            product.name,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: defaultPadding / 4,
                                        ),
                                        Text(
                                          '${product.prices.currencySymbol}${product.prices.price}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  return Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 4,
                            vertical: defaultPadding / 2),
                        child: Text(
                          cat.name,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        }
      }),
    );
  }
}


/* 

.replaceAll(RegExp('<[^>]+>'), '')

 */