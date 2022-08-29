import 'package:demoapps/model/color_model/button_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var getname;
  @override
  void initState() {
    super.initState();
    getinfo();
  }

  getinfo() async {
    SharedPreferences mailpref = await SharedPreferences.getInstance();
    setState(() {
      getname = mailpref.getString("gmailinfo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _top(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3 / 2),
              children: [
                InkWell(
                  onTap: () => print("Iclicked"),
                  child: _gridItem(
                    LineIcons.heartAlt,
                    "Button 1",
                  ),
                ),
                _gridItem(LineIcons.doctor, "Button 2"),
                _gridItem(LineIcons.tasks, "Button 3"),
                _gridItem(LineIcons.servicestack, "Button 4"),
                _gridItem(LineIcons.medicalClinic, "Button 5"),
                _gridItem(LineIcons.stethoscope, "Button 6"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff60be93), Color(0xff1b8d49)]),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Image.asset("images/assets/health-animated.gif"),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Hubungi Call Center Kami\n Di 0xxxxx",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Color(0xff99FFCD),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("images/assets/doctors_undraw_pot.png"),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Hi, ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff73A9AD)),
                  ),
                  Text(
                    "$getname",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_power,
                    color: Color.fromARGB(255, 255, 51, 51),
                  ))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Ketik Untuk Mencari...",
                fillColor: Color.fromARGB(180, 255, 255, 255),
                filled: true,
                suffix: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 150, // <-- Your width
                      height: 30, // <-- Your height
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("button pressed");
                        },
                        icon: Icon(
                          Icons.wallet,
                          color: Color(0xff82DBD8),
                        ),
                        label: Text(
                          "Buat Jadwal",
                          style: TextStyle(fontSize: 10),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff3BACB6)),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      width: 150, // <-- Your width
                      height: 30, // <-- Your height
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("button pressed");
                        },
                        icon: Icon(
                          Icons.map_sharp,
                          color: Color(0xff82DBD8),
                        ),
                        label: Text(
                          "Lokasi Terdekat",
                          style: TextStyle(fontSize: 10),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff3BACB6)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

_gridItem(icon, text) {
  return Column(
    children: [
      CircleAvatar(
        child: Icon(
          icon,
          size: 16.0,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff3BACB6),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text("$text")
    ],
  );
}
