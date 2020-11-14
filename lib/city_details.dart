import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityDetailsWidget extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final int index;

  CityDetailsWidget(this.name, this.image, this.description, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(name),
              background: Hero(tag: 'photo${index}',child: Image.network(image, fit: BoxFit.cover)),
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(description, style: TextStyle(
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}
