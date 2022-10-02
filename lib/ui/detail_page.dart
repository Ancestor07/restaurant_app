import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurantresponse.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(restaurant.pictureId),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                      ),
                      Text(restaurant.city),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 12,
                      ),
                      Text(restaurant.rating.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Description :"),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Food : "),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView(),
                ]),
          ),
        ],
      )),
    );
  }
}
