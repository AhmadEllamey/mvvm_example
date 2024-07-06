class Item {
  int? id;
  String? name;

  Item({this.id, this.name});

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      id: data['id'],
      name: data['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
