import 'package:Kusrc_table/model/navigation_item.dart';
import 'package:Kusrc_table/page/management_page.dart';
import 'package:Kusrc_table/page/register_time_page.dart';
import 'package:Kusrc_table/page/timetable_page.dart';
import 'package:Kusrc_table/provider/navigation_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Kusrc_table/firebase_options.dart';
import 'package:Kusrc_table/data/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await fetchData();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      // case NavigationItem.header:
      //   return HeaderPage();
      case NavigationItem.management:
        return ManagementPage();
      case NavigationItem.register_time:
        return RegistertimePage();
      case NavigationItem.timetable:
        return TimetablePage();
    }
  }
}
