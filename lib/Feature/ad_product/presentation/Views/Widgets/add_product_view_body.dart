import 'dart:io';
import 'package:dashbord_fruit/Core/Widget/custom_text_form_field.dart';
import 'package:dashbord_fruit/Feature/ad_product/domain/Entity/product_entity.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/custom_bottom.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/image_picker.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/is_feature_product.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/Views/Widgets/is_organic_product.dart';
import 'package:dashbord_fruit/Feature/ad_product/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? fileImage;
  bool isLoading = false;
  bool isOrganic = false;

  late String productName, description, productId;
  late num productPrice;
  late int expirationMonth, numberOfCalories, unitAmount;
  File? productImage;
  late bool isFeature;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomTextFormField(
                hint: 'Product Name',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  productName = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hint: 'Price',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  productPrice = num.parse(value!).toInt();
                },
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                hint: 'Product Id',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  productId = value!;
                },
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                hint: 'Expiration Month',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  expirationMonth = num.parse(value!).toInt();
                },
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                hint: 'Number of calories',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  numberOfCalories = num.parse(value!).toInt();
                },
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                hint: 'Unit Amount',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  unitAmount = num.parse(value!).toInt();
                },
              ),

              const SizedBox(height: 16),
              CustomTextFormField(
                hint: 'Discreption',
                keyboardType: TextInputType.text,
                onSave: (value) {
                  description = value!;
                },
                maxLine: 5,
              ),
              const SizedBox(height: 16),
              IsFeatureProduct(
                onChange: (value) {
                  isFeature = value!;
                },
              ),
              const SizedBox(height: 16),
              IsOrganicProduct(
                onChange: (value) {
                  isOrganic = value!;
                },
              ),
              const SizedBox(height: 8),

              CustomImagePicker(
                onImageChange: (value) {
                  productImage = value!;
                },
              ),
              const SizedBox(height: 16),

              CustomBottom(
                onPressed: () {
                  if (productImage != null) {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      ProductEntity product = ProductEntity(
                        description: description,
                        productId: productId,
                        productImage: productImage!,
                        productName: productName,
                        productPrice: productPrice,
                        expirationMonth: expirationMonth,
                        numberOfCalories: numberOfCalories,
                        unitAmount: unitAmount,
                        isOrganic: isOrganic,
                        isFeature: isFeature,
                        review: [],
                      );

                      context.read<ProductCubit>().addProduct(product);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('add Image')));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
