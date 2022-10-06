import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/model/restaurantresponse.dart';
import 'package:restaurant_app/ui/restoran_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewListPage.routeName,
      routes: {
        NewListPage.routeName: (context) => const NewListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
        // ArticleDetailPage.routeName: (context) => ArticleDetailPage(
        //       article: ModalRoute.of(context)?.settings.arguments as Article,
        //     ),
      },
    );
  }
}
