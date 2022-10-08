import 'package:http/http.dart' as http;
import '../globals/environment.dart';

class ApiMethods {
  Future get(String uri) async {
    final response = await http.get(Uri.parse('${Environment.apiUrl}/$uri'),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future post(String uri, data, {bool wcCredentials = false}) async {
    final response =
        await http.post(Uri.parse('${Environment.apiUrl}/$uri'), body: data);
    return response;
  }

  Future patch(String uri, data) async {
    final response = http.patch(
        Uri.parse('${Environment.apiUrl}/$uri?${Environment.wcCredentials}'),
        headers: {'Content-Type': 'application/json'},
        body: data);
    return response;
  }

  Future put(String uri, data) async {
    final response = http.put(
        Uri.parse('${Environment.apiUrl}/$uri?${Environment.wcCredentials}'),
        headers: {'Content-Type': 'application/json'},
        body: data);
    return response;
  }

  Future delete(String uri) async {
    final response = http.delete(
        Uri.parse('${Environment.apiUrl}/$uri?${Environment.wcCredentials}'),
        headers: {'Content-Type': 'application/json'});
    return response;
  }
}
