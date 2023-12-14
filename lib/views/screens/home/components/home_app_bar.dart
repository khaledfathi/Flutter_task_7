import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  String? title;
  bool isThemeLight ; 
  void Function()? onPressChangeTheme; 
  HomeAppBar({super.key, this.title, this.onPressChangeTheme ,required this.isThemeLight});

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
      ),
      titleSpacing: 50,
      actions: [
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
          // onPressed: onPressChangeTheme,
          onPressed: (){},
          icon: Icon(Icons.search),
          iconSize: 35,
        ),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
          onPressed: onPressChangeTheme,
          icon:isThemeLight ? Icon(Icons.mode_night_sharp): Icon(Icons.light_mode_rounded),
          iconSize: 35,
        ),
      ],
    );
  }
}
