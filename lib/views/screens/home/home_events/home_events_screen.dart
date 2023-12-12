import 'package:flutter/material.dart';
import 'package:task_l7/controllers/screens/home/home_events/home_events_controller.dart';

class HomeEventsScreen extends StatefulWidget {
  static const String route = 'home-events';
  const HomeEventsScreen({super.key});

  @override
  State<HomeEventsScreen> createState() => _HomeEventsScreenState();
}

class _HomeEventsScreenState extends State<HomeEventsScreen> {
  //screen controller
  final HomeEventsControllers _controller = HomeEventsControllers();
  //widgets tools
  final ScrollController _coulmnController = ScrollController();
  final GlobalKey _columnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            //header
            Container(
              color: Colors.purple,
              height: 100,
            ),
            //body
            Expanded(
              child: SingleChildScrollView(
                controller: _coulmnController,
                child: Column(key: _columnKey, children: [
                  ..._drawBoxs(10),
                  _drawButtons(),
                ]),
              ),
            ),
          ],
        ));
  }

  // draw boxs
  List<Widget> _drawBoxs(int count) {
    List<Widget> boxs = [];
    for (var i = 0; i < count; i++) {
      boxs.add(
        Container(
          color: Colors.deepOrangeAccent,
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Text(
            '${i + 1}',
            style: const TextStyle(fontSize: 40),
          ),
        ),
      );
    }
    return boxs;
  }

  Widget _drawButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () => _onPressClickMeButton(),
            child: const Text('Click Me')),
        ElevatedButton(
            onPressed: () => _controller.databaseTest(),
            child: const Text('Test DB')),
      ],
    );
  }

  void _onPressClickMeButton() {
    double columnHeight = _columnKey.currentContext!.size!.height;
    _coulmnController.animateTo(( columnHeight / 11 ) * 2,
        duration: const Duration(seconds: 1), curve: Curves.easeOutQuad);
  }
}
