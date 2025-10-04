import 'package:dashbord_fruit/Core/Widget/custom_button.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/add_product_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CusttomButtom(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductView.routeName);
            },
            text: 'أضف منتج',
          ),
        ),
      ),
    );
  }
}
