import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my102/main.dart';
import 'package:my102/screens/announcements_screen.dart';
import 'package:my102/screens/attendance_screen.dart';
import 'package:my102/screens/downloads_screen.dart';
import 'package:my102/screens/staffarea_screen.dart';
import 'package:my102/screens/training_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _extended = false;

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  _extended = false;
                });
              },
              extended: _extended,
              // minWidth: 55,
              indicatorColor: Theme.of(context).primaryColor,
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
                  icon: Icon(Icons.calendar_month_rounded),
                  label: Text('Attendance'),
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
              trailing: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: Icon(Icons.menu_rounded),
                    onPressed: () {
                      setState(() {
                        _extended = !_extended;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: SafeArea(child: buildPages()),
            ),
          ],
        ),
      );

  Widget buildPages() {
    switch (_selectedIndex) {
      case 0:
        return MainScreen();
      case 1:
        return AnnouncementsScreen();
      case 2:
        return AttendanceScreen();
      case 3:
        return TrainingScreen();
      case 4:
        return DownloadsScreen();
      case 5:
        return StaffAreaScreen();
      default:
        return MainScreen();
    }
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
