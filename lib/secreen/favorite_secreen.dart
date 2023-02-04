import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_example/provider/favorite_provider.dart';
import 'package:provider_learning_example/secreen/myfavorite_secreen.dart';

class FavoriteSecreen extends StatefulWidget {
  const FavoriteSecreen({super.key});

  @override
  State<FavoriteSecreen> createState() => _FavoriteSecreenState();
}

class _FavoriteSecreenState extends State<FavoriteSecreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite App'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavoriteSecreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
