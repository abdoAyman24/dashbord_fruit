import 'package:dashbord_fruit/Core/Repo/add_product_repo/add_product_repo.dart';
import 'package:dashbord_fruit/Core/Repo/image_repo/image_repo.dart';
import 'package:dashbord_fruit/Core/service/service_locator.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/add_product_view_builder.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('أضف منتج')),
      body: BlocProvider(
        create: (context) => ProductCubit(getIt.get<ImageRepo>(),getIt.get<AddProductRepo>(),),
        child: AddProductViewBlocBuilder(),
      ),
    );
  }
}


