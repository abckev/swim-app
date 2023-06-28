import 'package:flutter/material.dart';
import 'package:swim_application/provider/todos.dart';
import 'package:swim_application/responsive/desktop_scaffold.dart';
import 'package:swim_application/responsive/mobile_scaffold.dart';
import 'package:swim_application/responsive/responsive_layout.dart';
import 'package:swim_application/responsive/tablet_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCPNnkyHosTI7QjE6zjA8W4wnw-1nSUntI",
    projectId: "swim-application-22a16",
    messagingSenderId: "689169855280",
    appId: "1:689169855280:web:5d104473a54c78e616cef5",
  ));

  /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'SWIM APP';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.grey[300]),
          home: const ResponsiveLayout(
            mobileScaffold: MobileScaffold(),
            tabletScaffold: TabletScaffold(),
            desktopScaffold: DesktopScaffold(),
          )));
}
