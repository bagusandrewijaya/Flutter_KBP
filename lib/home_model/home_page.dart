import 'package:demoapps/pages/dashboard.dart';
import 'package:demoapps/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectedIndex = 0;
  void _NavigationBottom(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getInfo() async {
    String? getname = "";
    SharedPreferences mailpref = await SharedPreferences.getInstance();
    getname = mailpref.getString("gmailinfo");
  }

  final List<Widget> _pages = [Home(), DashBoard(), SettingPages()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_SelectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                gap: 8,
                selectedIndex: 0,
                onTabChange: _NavigationBottom,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: LineIcons.heartbeat,
                    text: "Healthy",
                  ),
                  GButton(
                    icon: LineIcons.calendar,
                    text: "CheckUp Date",
                  ),
                ]),
          ),
        ));
  }
}
