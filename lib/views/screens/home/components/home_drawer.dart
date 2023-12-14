import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_l7/views/screens/google_web_view/google_web_view_screen.dart';
import 'package:task_l7/views/screens/home/components/drawer_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeDrawer extends StatelessWidget {

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://google.com'));


  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth,
      backgroundColor: const Color.fromARGB(150, 50, 50, 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: screenHeight * 0.07),
        child: Column(
          children: [
            ..._ceateCardOptions(context),
            const Flexible(
              child: DrawerBackButton(),
            )
          ],
        ),
      ),
    );
  }

  //create options for drawer
  List<Widget> _ceateCardOptions(BuildContext context) {
    //drawer options
    final List<Map<String, dynamic>> drawerOptions = [
      {
        'iconData': Icons.delete_forever,
        'title': 'Delete all events',
        'onTap': () {/* controller.deleteAllEvents() */}
      },
      {
        'iconData': Icons.info,
        'title': 'Rate App',
        'onTap': () => Navigator.of(context).pushNamed(GoogleWebViewScreen.route),
      },
      {
        'iconData': Icons.star_rate_rounded,
        'title': 'About',
        'onTap': () {/* navigato to about page */}
      },
      {'iconData': Icons.exit_to_app, 'title': 'Exit', 'onTap': () => exit(0)},
    ];
    List<Widget> cards = [];
    for (var option in drawerOptions) {
      cards.add(InkWell(
        onTap: option['onTap'],
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.deepOrangeAccent,
          child: ListTile(
            leading: Icon(
              option['iconData'],
              size: 35,
            ),
            iconColor: Colors.white,
            title: Text(
              option['title'],
            ),
          ),
        ),
      ));
    }
    return cards;
  }
}
