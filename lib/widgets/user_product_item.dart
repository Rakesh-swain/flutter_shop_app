import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  UserProductItem(this.id, this.title, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageurl)),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('/edit-product', arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
