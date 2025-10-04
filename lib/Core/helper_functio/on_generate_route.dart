import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/add_product_view.dart';
import 'package:dashbord_fruit/Feature/dashbord/presentation/home_view.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
       case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold());
  }
}