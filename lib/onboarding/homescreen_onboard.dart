import 'package:demoapps/home_model/home_page.dart';
import 'package:demoapps/register_login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:demoapps/model/color_model/button_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demoapps/register_login_page/login_screen.dart';

class onboardScreen extends StatefulWidget {
  const onboardScreen({Key? key}) : super(key: key);
  @override
  State<onboardScreen> createState() => _onboardScreenState();
}

class _onboardScreenState extends State<onboardScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    checklogin();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool val;
    val = prefs.getBool('slogin') ?? false;
    if (val != false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          ModalRoute.withName("/landing"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: PageView.builder(
              itemCount: demo_data.length,
              controller: _pageController,
              itemBuilder: (context, index) => OnboardingScreen(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description)),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                    curve: Curves.ease, duration: Duration(milliseconds: 300));
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), primary: circleButton),
              child: Image.asset(
                'images/icons/right-arrow.png',
              )),
        )
      ],
    )));
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginPage(
                                title: 'test',
                              )));
                },
                style: ElevatedButton.styleFrom(primary: elevatedButtonclr),
                child: Text(
                  "LogIn",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Image.asset(
            image,
            height: 250,
          ),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const Spacer()
        ],
      )),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
      image: 'images/assets/doctors_undraw_pot.png',
      title: "lorem ipsum",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  Onboard(
      image: 'images/assets/undraw_medical_care.png',
      title: "lorem ipsum",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  Onboard(
      image: 'images/assets/undraw_medicine_b1ol.png',
      title: "lorem ipsum",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
];
