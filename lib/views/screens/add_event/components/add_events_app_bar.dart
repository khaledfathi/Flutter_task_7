import 'package:flutter/material.dart';

class AddEventsAppBar extends StatelessWidget implements PreferredSize {
  final void Function()? onTapSave;
  const AddEventsAppBar({super.key, 
    this.onTapSave
  });

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      actions: [
        InkWell(
          onTap: onTapSave,
          child: const Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        )
      ],
      leading: Center(
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close_rounded,
              size: 30,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
