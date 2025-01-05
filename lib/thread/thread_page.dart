import 'package:flutter/material.dart';

class ThreadPage extends StatelessWidget {
  const ThreadPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Thread Demo"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 24.0,
                child: LinearProgressIndicator(
                  value: 0.1,
                  backgroundColor: Colors.grey[700],
                  color: Colors.red[300],
                ),
              ),
              SizedBox(
                height: 24.0,
                child: LinearProgressIndicator(
                  value: 0.1,
                  backgroundColor: Colors.grey[700],
                  color: Colors.green[300],
                ),
              ),
              SizedBox(
                height: 24.0,
                child: LinearProgressIndicator(
                  value: 0.1,
                  backgroundColor: Colors.grey[700],
                  color: Colors.blue[300],
                ),
              )
            ],
          ),
        ),
      );

}