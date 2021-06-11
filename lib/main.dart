import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PageController _pCont;
  late int _index = 0;
  @override
  void initState() {
    _pCont = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pCont,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            child: RiveAnimation.asset(
              'assets/star.riv',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            child: RiveAnimation.asset(
              'assets/heart.riv',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) {
            _pCont.animateToPage(index,
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInCubic);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Star',
              icon: SizedBox(
                  height: 50, child: RiveAnimation.asset('assets/star.riv')),
            ),
            BottomNavigationBarItem(
              label: 'Heart',
              icon: SizedBox(
                height: 50,
                child: RiveAnimation.asset(
                  'assets/heart.riv',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
