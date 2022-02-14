import 'package:app/domain/call.dart';
import 'package:app/domain/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CallHelper {
  static final CallHelper _instance = CallHelper.internal();

  factory CallHelper() => _instance;

  CallHelper.internal();

  Future<Call> createCall(Call call) async {
    final url = Uri.parse("http://10.0.2.2:8080/calls");
    await http.post(url, body: {
      'name': call.name,
      'image': call.image,
      'category': call.category,
      'description': call.description,
      'quantity': call.quantity,
      'user_name': call.userName,
      'user_city': call.userCity,
      'user_state': call.userState,
    });
    return call;
  }

  Future<List> getAllCalls(User user) async {
    final url = Uri.parse("http://10.0.2.2:8080/calls/?user_name=" +
        user.name +
        "&user_city=" +
        user.city +
        "&user_state=" +
        user.state);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load calls');
    }
  }
}
