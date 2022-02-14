class User {
  static const String userTable = "userTable";
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String cityColumn = "city";
  static const String stateColumn = "state";

  int id = 0;
  String name = '';
  String city = '';
  String state = '';

  User();

  factory User.fromJson(Map<String, dynamic> json) {
    return User.fromMap(json);
  }

  User.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    city = map[cityColumn];
    state = map[stateColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      nameColumn: name,
      cityColumn: city,
      stateColumn: state,
    };
    if (id != 0) map[idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "User(name: $name, Address: $city - $state | id: $id)";
  }
}
