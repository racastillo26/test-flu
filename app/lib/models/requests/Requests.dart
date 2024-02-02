// ignore_for_file: non_constant_identifier_names
class ResponseRequest {
  int status;
  bool success;
  String message;
  String data;

  ResponseRequest(
      {required this.status,
      required this.success,
      required this.message,
      required this.data});

  factory ResponseRequest.fromJson(Map<String, dynamic> json) =>
      ResponseRequest(
          status: json["status"],
          success: json["success"],
          message: json["message"],
          data: json["data"]);
}
