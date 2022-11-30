import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
*/

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Angelo's app"),
            ),
            body: SizedBox.expand(
                child: PageView(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                Container(color: Colors.blue),
                Container(color: Colors.red),
              ],
            )),
            bottomNavigationBar: NavigationBar(
                selectedIndex: currentIndex,
                onDestinationSelected: (int index) {
                  _controller.jumpToPage(index);
                },
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.book), label: 'Registration'),
                ])));
  }
}
