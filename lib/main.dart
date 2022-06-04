import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/cart_screen.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import 'providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        //home: ProductsOverviewScreen(),
        routes: {
          '/': (context) => ProductsOverviewScreen(),
          '/product-detail': (context) => ProductDetailScreen(),
          '/cart': (context) => CartScreen(),
          '/orders': (context) => OrdersScreen(),
          '/user-products': (context) => UserProductScreen(),
        },
      ),
    );
  }
}
