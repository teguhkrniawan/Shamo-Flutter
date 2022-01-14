
import 'package:shamo/models/galeri_model.dart';
import 'package:shamo/models/kategori_model.dart';

class ProdukModel{
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  List<GalleryModel> galleries;

  ProdukModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.galleries
  });

  ProdukModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
                  .map<GalleryModel>((item) => GalleryModel.fromJson(item))
                  .toList();
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name' : name,
      'price' : price,
      'description' : description,
      'tags' : tags,
      'category' : category.toJson(),
      'galleries' : galleries.map((item) => item.toJson()).toList()
    };
  }


}