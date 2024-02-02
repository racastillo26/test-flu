// ignore_for_file: non_constant_identifier_names
class ResponseUser {
  int status;
  bool success;
  String message;
  List<Users> data;

  ResponseUser(
      {required this.status,
      required this.success,
      required this.message,
      required this.data});

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
      status: json["status"],
      success: json["success"],
      message: json["message"],
      data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))));
}

class Users {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
