// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Categories {
  List<Category> items = [];
  Categories();
  Categories.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final category = Category.fromJson(item);
      items.add(category);
    }
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.parent,
    required this.count,
    this.image,
    required this.reviewCount,
    required this.permalink,
  });

  int id;
  String name;
  String slug;
  String description;
  int parent;
  int count;
  dynamic image;
  int reviewCount;
  String permalink;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        image: json["image"],
        reviewCount: json["review_count"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "parent": parent,
        "count": count,
        "image": image,
        "review_count": reviewCount,
        "permalink": permalink,
      };
}
