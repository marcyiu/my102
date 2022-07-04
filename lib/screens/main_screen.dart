import 'package:flutter/material.dart';
import '../main.dart';
import 'home_screen.dart';
import 'announcements_screen.dart';
import 'attendance_screen.dart';
import 'downloads_screen.dart';
import 'staffarea_screen.dart';
import 'training_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _extended = false;
  double _scaleX = -1;

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
                  _scaleX = -1;
                });
              },
              extended: _extended,
              // minWidth: 55,
              indicatorColor: Theme.of(context).primaryColor,
              selectedIconTheme: const IconThemeData(color: Colors.white),
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
                    icon: Transform.scale(
                      scaleX: _scaleX,
                      child: Icon(Icons.menu_open_rounded),
                    ),
                    onPressed: () {
                      setState(() {
                        _extended = !_extended;
                      });

                      if (_scaleX == -1) {
                        setState(() {
                          _scaleX = 1;
                        });
                      } else {
                        setState(() {
                          _scaleX = -1;
                        });
                      }
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
        return HomeScreen();
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
        return HomeScreen();
    }
  }
}
