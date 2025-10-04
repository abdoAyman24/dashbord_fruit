import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IsOrganicProduct extends StatelessWidget {
  const IsOrganicProduct({super.key, required this.onChange});
  final ValueChanged onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('IS Organic Product'),
        Spacer(),
        CustomCheckBox(onChange:onChange),
      ],
    );
  }
}