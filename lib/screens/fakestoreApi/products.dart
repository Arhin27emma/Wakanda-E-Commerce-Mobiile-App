import 'dart:convert';
import 'package:app/constants.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final double rating;

  ProductModel(
    {
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image,
      required this.rating
    }
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['thumbnail'],
      rating: json['rating'].toDouble(),
    );
  }
}

class Products{
  Future<List<ProductModel>> getProduct() async{
    final response = await http.get(Uri.parse(dummyUrl));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<ProductModel> list = [];
      for (var i = 0; i < data['products'].length; i++){
        final entry = data['products'][i];
        list.add(ProductModel.fromJson(entry));
      }
      return list;
    }else{
      throw Exception('Http failed');
    }
  }
}




