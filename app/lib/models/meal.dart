class Meal {
  int? id;
  String name;


  Meal(this.name);

  Meal.fromJSON(dynamic json)
      : id = json['id'],
        name = '${json['name']}';

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Meal{id: $id, name: $name}';
  }
}
