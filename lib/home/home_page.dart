import 'package:flutter/material.dart';
import 'package:libreview/thread/thread_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item("item 1", () => ThreadPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lib Review'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item.builder.call(),
                    ),
                  );
                },
                child: Text(item.title),
              ),
            );
          }),
    );
  }
}

typedef WidgetBuilder = Widget Function();

class Item {
  final String title;
  final WidgetBuilder builder;

  Item(this.title, this.builder);
}
