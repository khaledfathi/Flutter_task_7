import 'package:flutter/material.dart';
import 'package:task_l7/controllers/enum/bottom_dialog_mode.dart';

class BottomButtonsDialog extends StatelessWidget {
  final double height;
  final double width;
  final void Function()? onTapButtonOne;
  final void Function()? onTapButtonTwo;
  final void Function()? onTapButtonThree;
  final BottomDialogMode? mode;

  const BottomButtonsDialog(
      {super.key,
      required this.height,
      required this.width,
      this.onTapButtonOne,
      this.onTapButtonTwo,
      this.onTapButtonThree,
      this.mode = BottomDialogMode.active});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.black,
            width: width,
            height: height,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: _buttons(),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buttons() {
    List<Map<String, dynamic>> widgetSettings = [{}, {}, {}];

    switch (mode) {
      case BottomDialogMode.active:
       widgetSettings = [
        {'title': 'Done', 'color': Colors.blue, 'onPressed': onTapButtonOne},
        {'title': 'Archive', 'color': Colors.grey, 'onPressed': onTapButtonTwo},
        {'title': 'Delete', 'color': Colors.red, 'onPressed': onTapButtonThree},
        ];
      case BottomDialogMode.done:
       widgetSettings = [
        {'title': 'Active', 'color': Colors.green, 'onPressed': onTapButtonOne},
        {'title': 'Archive', 'color': Colors.grey, 'onPressed': onTapButtonTwo},
        {'title': 'Delete', 'color': Colors.red, 'onPressed': onTapButtonThree},
        ];
      case BottomDialogMode.archive:
       widgetSettings = [
        {'title': 'Active', 'color': Colors.green, 'onPressed': onTapButtonOne},
        {'title': 'Done', 'color': Colors.blue, 'onPressed': onTapButtonTwo},
        {'title': 'Delete', 'color': Colors.red, 'onPressed': onTapButtonThree},
        ];
      default: null; 
    }

    List<Widget> buttons = [];
    for (var i = 0; i < 3; i++) {
      buttons.add(
        Expanded(
            child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: widgetSettings[i]['color'],
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            height: double.infinity,
            minWidth: double.infinity,
            onPressed:widgetSettings[i]['onPressed'],
            child: Text(widgetSettings[i]['title'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )),
      );
    }
    return buttons;
  }
}
