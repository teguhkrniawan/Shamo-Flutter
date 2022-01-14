
class CategoryModel {

  int id;
  String namaKategori;

  CategoryModel({
    this.id,
    this.namaKategori
  });

  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    namaKategori = json['name'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'nama_kategori' : namaKategori
    };
  }

}