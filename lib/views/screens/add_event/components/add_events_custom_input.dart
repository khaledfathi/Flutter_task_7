import 'package:flutter/material.dart';

class AddEventsCustomInput extends StatelessWidget {
  final IconData iconData;
  final TextEditingController? controller;
  final String? hintText; 
  final void Function()? onPressIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType ; 

  const AddEventsCustomInput({
    super.key,
    required this.iconData,
    this.controller,
    this.onPressIcon,
    this.onSaved,
    this.validator,
    this.hintText,
    this.keyboardType, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          validator: validator,
          onSaved: onSaved ,         
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType:keyboardType,
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
                borderSide: BorderSide(color: Colors.red, width: 3)),
            border: InputBorder.none,
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red , width: 3)), 
          )),
    );
  }
}
