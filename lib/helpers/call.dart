import 'package:app/domain/call.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.parse("http://10.0.2.2:8080/calls");

class CallHelper {
  static final CallHelper _instance = CallHelper.internal();

  factory CallHelper() => _instance;

  CallHelper.internal();

  Future<Call> createCall(Call call) async {
    await http.post(url, body: {
      'name': call.name,
      'image': call.image,
      'category': call.category,
      'description': call.description,
      'quantity': call.quantity,
      'userName': call.userName,
      'userCity': call.userCity,
      'userState': call.userState,
    });
    return call;
  }

  Future<List> getAllCalls() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load calls');
    }
  }

  // Future<Call?> getCall(int id) async {
  //   Database? dbCall = await db;
  //   if (dbCall != null) {
  //     List<Map> maps = await dbCall.query(Call.callTable,
  //         columns: [
  //           Call.idColumn,
  //           Call.nameColumn,
  //           Call.emailColumn,
  //           Call.phoneColumn,
  //           Call.imgColumn
  //         ],
  //         where: "${Call.idColumn} = ?",
  //         whereArgs: [id]);
  //     return maps.isNotEmpty ? Call.fromMap(maps.first) : null;
  //   }
  //   return null;
  // }

  // Future<int> deleteCall(int id) async {
  //   Database? dbCall = await db;
  //   if (dbCall == null) return 0;
  //   return await dbCall.delete(Call.callTable,
  //       where: "${Call.idColumn} = ?", whereArgs: [id]);
  // }

  // Future<int> updateCall(Call c) async {
  //   Database? dbCall = await db;
  //   if (dbCall != null) {
  //     return await dbCall.update(Call.callTable, c.toMap(),
  //         where: "${Call.idColumn} = ?", whereArgs: [c.id]);
  //   } else {
  //     return 0;
  //   }
  // }
}
