import 'package:flutter/material.dart';
import 'package:my102/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyApp.appTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'My102',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Announcements'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Training'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Downloads'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Staff Area'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
