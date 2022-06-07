import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
// import '../providers/products_provider.dart';
// import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/products_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

// ignore: use_key_in_widget_constructors
class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // first methhod
    //Provider.of<ProductsProvider>(context, listen: false).fetchAndSetProduct();
    //Second method
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<ProductsProvider>(context, listen: false)
    //       .fetchAndSetProduct();
    // });
    super.initState();
  }

  //Third method
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductsProvider>(context, listen: false)
          .fetchAndSetProduct()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final productsContainer =  Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    // productsContainer.showFavoriteOnly();
                    _showOnlyFavorites = true;
                  } else {
                    // productsContainer.showAll();
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.All),
                  ]),
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
