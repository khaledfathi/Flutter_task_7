import 'package:flutter/material.dart';

class HomeBottomNavigatorBar extends StatelessWidget {
  int? selectedIndex;
  void Function(int index)? onDestinationSelected;
  HomeBottomNavigatorBar({super.key, 
    this.selectedIndex , 
    this.onDestinationSelected
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        animationDuration: const Duration(milliseconds: 800),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex ?? 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu), label: 'Event'),
          NavigationDestination(
              icon: Icon(Icons.check_circle_outline_rounded), label: 'Done'),
          NavigationDestination(
              icon: Icon(Icons.archive_outlined), label: 'Arvhice'),
        ]);
  }
}
