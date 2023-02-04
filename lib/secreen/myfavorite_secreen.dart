import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class MyFavoriteSecreen extends StatefulWidget {
  const MyFavoriteSecreen({super.key});

  @override
  State<MyFavoriteSecreen> createState() => _MyFavoriteSecreenState();
}

class _MyFavoriteSecreenState extends State<MyFavoriteSecreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite App '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
