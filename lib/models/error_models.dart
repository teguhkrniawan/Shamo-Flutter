
class MyErrorModel {
  int code;
  String status;
  String messagge;

  // constructor
  MyErrorModel({
    this.code,
    this.status,
    this.messagge
  });

  MyErrorModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    messagge = json['message'];
  } 

  Map<String, dynamic> toJson(){
     return {
       'code' : code,
       'status' : status,
       'message' : messagge
     };
  }
}