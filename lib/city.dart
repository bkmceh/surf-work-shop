class City {
  final int id;
  final String name;
  final String image;
  final String description;


  City(this.id, this.name, this.image, this.description);


  City.fromMappedJson(Map<String, dynamic> json) :
  id = json['id'],
  name = json['name'] ?? '',
  image = json['image'] ?? '',
  description = json['description'] ?? '';


  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'imageUrl': image,
        'description': description,
      };
}


class CityList {
  List<City> cities;

  CityList(this.cities);

  CityList.fromMappedJson(Map<String, dynamic> json) {
    var list = json['cities'] as List;
    cities = list.map((city) => City.fromMappedJson(city)).toList();
  }
}