import 'package:flutter/material.dart';
import 'package:my102/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _extended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sqn_insignia_simple.png',
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(MyApp.appTitle),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            setState(() {
              _extended = !_extended;
            });
          },
        ),
        backgroundColor: Colors.lightBlue[900],
        foregroundColor: Colors.white,
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: Text(
      //           'My102',
      //           style: Theme.of(context).textTheme.headline5,
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home_rounded),
      //         title: Text('Home'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.announcement_rounded),
      //         title: Text('Announcements'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.school_rounded),
      //         title: Text('Training'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.download_rounded),
      //         title: Text('Downloads'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.work_rounded),
      //         title: Text('Staff Area'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            extended: _extended,
            selectedIconTheme: IconThemeData(color: Colors.white),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_rounded),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.announcement_rounded),
                label: Text('Announcements'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.school_rounded),
                label: Text('Training'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.download_rounded),
                label: Text('Downloads'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.work_rounded),
                label: Text('Staff Area'),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
