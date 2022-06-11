import 'package:flutter/material.dart';
import '../helpers/custom_route.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).accentColor,
            ),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Theme.of(context).accentColor,
            ),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/orders');
              // Navigator.of(context).pushReplacement(CustomRoute(
              //   builder: (ctx) => OrdersScreen(),
              // ));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Theme.of(context).accentColor,
            ),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/user-products');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).accentColor,
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
