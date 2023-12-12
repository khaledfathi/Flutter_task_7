import 'package:flutter/material.dart';

class HomeDoneScreen extends StatefulWidget {
  static const String route = 'home-done';
  const HomeDoneScreen({super.key});

  @override
  State<HomeDoneScreen> createState() => _HomeDoneScreenState();
}

class _HomeDoneScreenState extends State<HomeDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
