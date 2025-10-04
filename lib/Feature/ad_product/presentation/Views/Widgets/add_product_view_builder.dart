import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/add_product_view_body.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBlocBuilder extends StatelessWidget {
  const AddProductViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ProductCubitLoad,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
