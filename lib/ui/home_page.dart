import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common.dart/styles.dart';
import 'package:restaurant_app/widget/platform_widget.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/model/restaurantresponse.dart';
import 'package:restaurant_app/ui/restoran_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/restaurant_list';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'Headline';

  final List<Widget> _listWidget = const [
    NewListPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
          Platform.isIOS ? CupertinoIcons.rectangle_grid_1x2 : Icons.public),
      label: _headlineText,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItem,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: (const CupertinoNavigationBar(
          middle: Text('Restaurant App'),
          transitionBetweenRoutes: false,
        )),
        child: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('asset/restaurants.json'),
      builder: (context, snapshot) {
        final RestaurantResponse restaurantResponse =
            restaurantResponseFromJson(snapshot.data.toString());
        final List<Restaurant> restaurants = restaurantResponse.restaurants;
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return _buildRestaurantItem(context, restaurants[index]);
          },
        );
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Material(
        child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    ));
  }
}
