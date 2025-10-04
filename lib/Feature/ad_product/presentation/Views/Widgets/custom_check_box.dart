import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChange});
  final ValueChanged onChange;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        setState(() {
          widget.onChange (isSelected);
        });
      },

      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          border: BoxBorder.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isSelected
            ? Center(child: Icon(Icons.check, color: Colors.white, size: 18))
            : SizedBox(),
      ),
    );
  }
}
