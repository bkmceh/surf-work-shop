import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_work_shop/city.dart';
import 'package:surf_work_shop/city_details.dart';

class CitiesListWidget extends StatefulWidget {
  @override
  _CitiesListWidgetState createState() => _CitiesListWidgetState();
}

class _CitiesListWidgetState extends State<CitiesListWidget> {
  List<City> cities = List();

  @override
  void initState() {
    parseCitiesList().then((value) =>
    {
      setState(() {
        cities = value;
      })
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CityDetailsWidget(cities[index].name, cities[index].image,
                        // ignore: missing_return
                        cities[index].description, cities[index].id);
                  }

              ));
            },
            child: CustomItemWidget(
                cities[index].name, cities[index].id, cities[index].image),
          );
        },
        itemCount: cities != null ? cities.length : 0,
      ),
    );
  }

  Future<List<City>> parseCitiesList() async {
    String data =
    await DefaultAssetBundle.of(context).loadString('res/json/cities.json');
    Map<String, dynamic> decodeJson = jsonDecode(data);
    CityList cityList = CityList.fromMappedJson(decodeJson);
    return cityList.cities;
  }
}

class CustomItemWidget extends StatelessWidget {
  final String name;
  final int index;
  final String image;

  CustomItemWidget(this.name, this.index, this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 128,
                width: 128,
                child: Hero(tag: 'photo${index}',child: Image.network(image)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }
}
