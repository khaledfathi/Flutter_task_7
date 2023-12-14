import 'package:flutter/material.dart';

class DrawerBackButton extends StatelessWidget {
  const DrawerBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(100)),
        child:const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 100,
        ),
      ),
    ));
  }
}
