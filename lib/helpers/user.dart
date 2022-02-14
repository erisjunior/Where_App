import 'package:app/domain/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserHelper {
  static final UserHelper _instance = UserHelper.internal();

  factory UserHelper() => _instance;

  UserHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    return _db ?? await initDb();
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "user.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE ${User.userTable}(${User.idColumn} INTEGER PRIMARY KEY, "
          "                                 ${User.nameColumn} TEXT, "
          "                                 ${User.cityColumn} TEXT, "
          "                                 ${User.stateColumn} TEXT) ");
    });
  }

  Future<User> saveUser(User user) async {
    Database? dbUser = await db;
    if (dbUser != null) {
      await deleteAllUser();
      user.id = await dbUser.insert(User.userTable, user.toMap());
    }
    return user;
  }

  Future<User?> getUser(int id) async {
    Database? dbUser = await db;
    if (dbUser != null) {
      List<Map> maps = await dbUser.query(User.userTable,
          columns: [
            User.idColumn,
            User.nameColumn,
            User.cityColumn,
            User.stateColumn,
          ],
          where: "${User.idColumn} = ?",
          whereArgs: [id]);
      return maps.isNotEmpty ? User.fromMap(maps.first) : null;
    }
    return null;
  }

  Future<int> deleteUser(int id) async {
    Database? dbUser = await db;
    if (dbUser == null) return 0;
    return await dbUser
        .delete(User.userTable, where: "${User.idColumn} = ?", whereArgs: [id]);
  }

  Future<int> deleteAllUser() async {
    Database? dbUser = await db;
    if (dbUser == null) return 0;
    return await dbUser.delete(User.userTable);
  }

  Future<int> updateUser(User c) async {
    Database? dbUser = await db;
    if (dbUser != null) {
      return await dbUser.update(User.userTable, c.toMap(),
          where: "${User.idColumn} = ?", whereArgs: [c.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAllUser() async {
    Database? dbUser = await db;
    if (dbUser != null) {
      List listMap = await dbUser.query(User.userTable);
      List<User> listUsers = [];

      for (Map m in listMap) {
        listUsers.add(User.fromMap(m));
      }
      return listUsers;
    } else {
      return [];
    }
  }

  Future<User> getSingleUser() async {
    Database? dbUser = await db;
    if (dbUser != null) {
      List listMap = await dbUser.query(User.userTable);
      List<User> listUsers = [];

      for (Map m in listMap) {
        listUsers.add(User.fromMap(m));
      }
      if (listUsers.isNotEmpty) {
        return listUsers.first;
      }
    }
    User user = User();
    return user;
  }
}
