class MenuDto {
  final String id;
  final String name;
  final String restaurantId;
  final List<MenuItemDto>? items;

  const MenuDto(
      {required this.id,
      required this.name,
      required this.restaurantId,
      required this.items});

  factory MenuDto.fromJson(Map<String, dynamic> json) {
    var a = MenuDto(
        id: json["id"],
        name: json["name"],
        restaurantId: json["restaurantId"],
        items: json["items"]
            .map<MenuItemDto>((json) => MenuItemDto.fromJson(json))
            .toList());
    return a;
  }
}

class MenuItemDto {
  final String id;
  final String name;

  const MenuItemDto({required this.id, required this.name});

  factory MenuItemDto.fromJson(Map<String, dynamic> json) {
    return MenuItemDto(id: json["id"], name: json["name"]);
  }
}

class Menu {
  final String id;
  String name;
  String restaurantId;

  Menu({
    required this.id,
    required this.name,
    required this.restaurantId,
  });

  // return Menu{
  //   id: id,
  //   name: name,
  //   restaurantId: restaurantId
  // };
}
