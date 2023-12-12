import 'package:flutter/material.dart';

class HomeArchiveScreen extends StatefulWidget {
  static const String route = 'home-archive'; 
  const HomeArchiveScreen({super.key});

  @override
  State<HomeArchiveScreen> createState() => _HomeArchiveScreenState();
}

class _HomeArchiveScreenState extends State<HomeArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Container(color: Colors.red,),
    ); 
  }
}