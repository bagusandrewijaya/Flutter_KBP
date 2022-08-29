import 'package:demoapps/home_model/home_page.dart';
import 'package:demoapps/register_login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/homescreen_onboard.dart';

int? onboardscreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'onboarding',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: onboardScreen(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new HomePage(),
          '/landing': (BuildContext context) => new onboardScreen(),
        });
  }
}
