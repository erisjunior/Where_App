class Call {
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String descriptionColumn = "description";
  static const String categoryColumn = "category";
  static const String imageColumn = "image";
  static const String userNameColumn = "userName";
  static const String userCityColumn = "userCity";
  static const String userStateColumn = "userState";
  static const String quantityColumn = "quantity";

  int id = 0;
  String name = '';
  String description = '';
  String category = '';
  String image = '';
  String userName = '';
  String userCity = '';
  String userState = '';
  String quantity = '';

  Call();

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call.fromMap(json);
  }

  Call.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    description = map[descriptionColumn];
    category = map[categoryColumn];
    image = map[imageColumn];
    userName = map[userNameColumn];
    userCity = map[userCityColumn];
    userState = map[userStateColumn];
    quantity = map[quantityColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      idColumn: id,
      nameColumn: name,
      descriptionColumn: description,
      categoryColumn: category,
      imageColumn: image,
      userNameColumn: userName,
      userCityColumn: userCity,
      userStateColumn: userState,
      quantityColumn: quantity,
    };
    if (id != 0) map[idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "Call(id: $id, name: $name, description: $description, category: $category, image: $image, userName: $userName, userCity: $userCity, userState: $userState, quantity: $quantity)";
  }
}
