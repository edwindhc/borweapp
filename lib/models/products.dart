// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Products {
  List<Product> items = [];
  Products();
  Products.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final prod = Product.fromJson(item);
      items.add(prod);
    }
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.parent,
    required this.type,
    required this.variation,
    required this.permalink,
    required this.sku,
    required this.shortDescription,
    required this.description,
    required this.onSale,
    required this.prices,
    required this.priceHtml,
    required this.averageRating,
    required this.reviewCount,
    required this.images,
    required this.categories,
    required this.tags,
    required this.attributes,
    required this.variations,
    required this.hasOptions,
    required this.isPurchasable,
    required this.isInStock,
    required this.isOnBackorder,
    required this.lowStockRemaining,
    required this.soldIndividually,
    required this.addToCart,
    required this.extensions,
  });

  int id;
  String name;
  int parent;
  String type;
  String variation;
  String permalink;
  String sku;
  String shortDescription;
  String description;
  bool onSale;
  Prices prices;
  String priceHtml;
  String averageRating;
  int reviewCount;
  List<Image> images;
  List<Category> categories;
  List<dynamic> tags;
  List<dynamic> attributes;
  List<dynamic> variations;
  bool hasOptions;
  bool isPurchasable;
  bool isInStock;
  bool isOnBackorder;
  dynamic lowStockRemaining;
  bool soldIndividually;
  AddToCart addToCart;
  Extensions extensions;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        parent: json["parent"],
        type: json["type"],
        variation: json["variation"],
        permalink: json["permalink"],
        sku: json["sku"],
        shortDescription: json["short_description"],
        description: json["description"],
        onSale: json["on_sale"],
        prices: Prices.fromJson(json["prices"]),
        priceHtml: json["price_html"],
        averageRating: json["average_rating"],
        reviewCount: json["review_count"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        hasOptions: json["has_options"],
        isPurchasable: json["is_purchasable"],
        isInStock: json["is_in_stock"],
        isOnBackorder: json["is_on_backorder"],
        lowStockRemaining: json["low_stock_remaining"],
        soldIndividually: json["sold_individually"],
        addToCart: AddToCart.fromJson(json["add_to_cart"]),
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent": parent,
        "type": type,
        "variation": variation,
        "permalink": permalink,
        "sku": sku,
        "short_description": shortDescription,
        "description": description,
        "on_sale": onSale,
        "prices": prices.toJson(),
        "price_html": priceHtml,
        "average_rating": averageRating,
        "review_count": reviewCount,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "has_options": hasOptions,
        "is_purchasable": isPurchasable,
        "is_in_stock": isInStock,
        "is_on_backorder": isOnBackorder,
        "low_stock_remaining": lowStockRemaining,
        "sold_individually": soldIndividually,
        "add_to_cart": addToCart.toJson(),
        "extensions": extensions.toJson(),
      };
}

class AddToCart {
  AddToCart({
    required this.text,
    required this.description,
    required this.url,
    required this.minimum,
    required this.maximum,
    required this.multipleOf,
  });

  String text;
  String description;
  String url;
  int minimum;
  int maximum;
  int multipleOf;

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        text: json["text"],
        description: json["description"],
        url: json["url"],
        minimum: json["minimum"],
        maximum: json["maximum"],
        multipleOf: json["multiple_of"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "description": description,
        "url": url,
        "minimum": minimum,
        "maximum": maximum,
        "multiple_of": multipleOf,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.link,
  });

  int id;
  String name;
  String slug;
  String link;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "link": link,
      };
}

class Extensions {
  Extensions();

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions();

  Map<String, dynamic> toJson() => {};
}

class Image {
  Image({
    required this.id,
    required this.src,
    required this.thumbnail,
    required this.srcset,
    required this.sizes,
    required this.name,
    required this.alt,
  });

  int id;
  String src;
  String thumbnail;
  String srcset;
  String sizes;
  String name;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        src: json["src"],
        thumbnail: json["thumbnail"],
        srcset: json["srcset"],
        sizes: json["sizes"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "thumbnail": thumbnail,
        "srcset": srcset,
        "sizes": sizes,
        "name": name,
        "alt": alt,
      };
}

class Prices {
  Prices({
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.priceRange,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  String price;
  String regularPrice;
  String salePrice;
  dynamic priceRange;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        priceRange: json["price_range"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "price_range": priceRange,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
      };
}
