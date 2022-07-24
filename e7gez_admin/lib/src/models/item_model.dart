
class ItemModel {
  late int id;
  late String name;

  ItemModel();
  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
  }
}
