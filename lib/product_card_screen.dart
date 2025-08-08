import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  final  String title;
  final  String price;
  final String imageUrl;
  final Color color;

  const Productcard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: color,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text("₹ $price",
              style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  height: 250,
                  width: 350,
                  image: AssetImage(imageUrl,
                  ),
                  // fit: BoxFit.fill,
                  // height: 300,
                  // width: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
