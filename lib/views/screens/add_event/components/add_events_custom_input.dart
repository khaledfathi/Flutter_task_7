import 'package:flutter/material.dart';

class AddEventsCustomInput extends StatelessWidget {
  final IconData iconData;
  final TextEditingController? controller;
  final String? hintText; 
  final void Function()? onPressIcon;
  final String? Function(String?)? validator;

  const AddEventsCustomInput({
    super.key,
    required this.iconData,
    this.controller,
    this.onPressIcon,
    this.validator,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(iconData , color: Theme.of(context).colorScheme.onSecondary,),
                onPressed: onPressIcon,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrangeAccent, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline, width: 2)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2)),
            border: InputBorder.none,
          )),
    );
  }
}
