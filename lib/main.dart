import 'package:flutter/material.dart';
import 'package:flutter_cart/providers/dark.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/order_screen.dart';
import './screens/user_products_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

import './providers/auth.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (ctx) => DarkModeProvider(),),
        ChangeNotifierProvider(create: (ctx) => Auth(),),
        ChangeNotifierProvider(create: (ctx) => Products(),),
        ChangeNotifierProvider(create: (ctx) => Cart(),),
        ChangeNotifierProvider(create: (ctx) => Orders(),),
      ],
      child: Consumer<DarkModeProvider>(
        builder: (context, darkParm, _) {
          Provider.of<DarkModeProvider>(context).changeMode(DarkMode.OPEN);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: darkParm.darkMode == DarkMode.OPEN?Colors.purple : Colors.blue,
              accentColor: darkParm.darkMode == DarkMode.OPEN?Colors.deepOrange:Colors.yellow,
              fontFamily: 'Lato',
            ),
            home: ProductsOverviewScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName:(ctx) => CartScreen(),
              OrderScreen.routeName:(ctx) => OrderScreen(),
              UserProductsScreen.routeName:(ctx) => UserProductsScreen(),
              EditProductScreen.routeName:(ctx) => EditProductScreen(),
              AuthScreen.routeName:(ctx) => AuthScreen(),
            },
          );
        }
      ),
  );
}}