abstract class BaseApiService {
  final String baseUrl = "http://localhost:8080/api/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, dynamic body);
  Future<dynamic> putResponse(String url, dynamic body);
}
