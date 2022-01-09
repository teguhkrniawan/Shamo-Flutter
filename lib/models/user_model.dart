
/**
 * Model pelanggan
 */
class UserModel{
  String id;
  String nama;
  String username;
  String email;
  String role;
  String token;
  String alamat;
  String telepon;
  String profile_pict;

  // constructor
  UserModel({
    this.id,
    this.nama,
    this.username,
    this.email,
    this.role,
    this.token,
    this.alamat,
    this.telepon,
    this.profile_pict
  });

  // model from JSON
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    role = json['role'];
    token = json['remember_token'];
    alamat = json['alamat'];
    telepon = json['telepon'];
    alamat = json['alamat'];
    profile_pict = json['profile_photo_url'];
  }

  // model toJson
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'nama' : nama,
      'email' : email,
      'username' : username,
      'profile_photo_url' : profile_pict,
      'token' : token
    };
  }
}