import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_cubit.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/bloc/cubit/login_cubit/login_cubit.dart';
import '../../core/commons/commons.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_file_image.dart';
import '../../core/widgets/custom_image.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.addDishToMenu.tr(context)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Center(
              child: BlocConsumer<MenuCubit,MenuState>(
                listener: (context,state) {
                  if(state is AddDishSucessState){
                    showToast(
                      message: AppStrings.mealAddedSucessfully,
                      state: ToastStates.success);
                    Navigator.pop(context);
                    BlocProvider.of<MenuCubit>(context).getAllMeals();
                    }
                  },
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                 return Form(
                   key: menuCubit.addToMenuKey,
                   child: Column(
                    children: [
                      ///add photo
                      Stack(
                        children: [
                          //image
                          CustomFileImage(
                              image: menuCubit.image,
                              ),
                          //add icon
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            bottom: 0,
                            end: 0,
                            child: IconButton(
                                onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Dialog(
                                          backgroundColor: AppColors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),

                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              //camera
                                              ListTile(
                                                leading: Icon(Icons.camera_alt,color: AppColors.primary,),
                                                title: Text(
                                                  AppStrings.camera.tr(context),
                                                  style: TextStyle(fontSize: 24,color: AppColors.primary),
                                                ),
                                                onTap: (){
                                                  Navigator.pop(context);
                                                  pickImage(ImageSource.camera)
                                                      .then((value) => menuCubit.takeImage(value));
                                                },
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              //gallary
                                              ListTile(
                                                leading: Icon(Icons.photo,color: AppColors.primary,),
                                                title: Text(AppStrings.gallery.tr(context),
                                                  style: TextStyle(fontSize: 24,color: AppColors.primary),
                                                ),
                                                onTap: (){
                                                  Navigator.pop(context);
                                                  pickImage(ImageSource.gallery)
                                                      .then((value) => menuCubit.takeImage(value));

                                                },
                                              ),

                                            ],
                                          ),
                                        );
                                      }
                                      );
                                },
                                icon: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: AppColors.orangeEdit,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(
                                    Icons.edit,
                                    color: AppColors.white,
                                  ),
                                ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ///name text
                      CustomTextFormField(
                          controller: menuCubit.mealNameController,
                      hint: AppStrings.mealName.tr(context),
                        validate: (data){
                            if(data!.isEmpty){
                              return AppStrings.pleaseEnterValidMealName.tr(context);
                            }
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ///price text
                      CustomTextFormField(
                        controller: menuCubit.mealPriceController,
                        hint: AppStrings.mealPrice.tr(context),
                        validate: (data){
                          if(num.tryParse(data!)==null){
                            return AppStrings.pleaseEnterValidMealPrice.tr(context);
                          }
                           if(data!.isEmpty){
                              return AppStrings.pleaseEnterValidMealPrice.tr(context);
                         }
                         return null;
                        },
                       ),
                      SizedBox(
                        height: 16,
                      ),
                      ///category text
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text(AppStrings.category.tr(context)),
                            value: menuCubit.selectedItem,
                            items:
                              menuCubit.categoryList.map((e) =>
                                  DropdownMenuItem(
                                    child: Text(e),
                                    value: e,)
                              ).toList(),
                            onChanged: (data){
                            menuCubit.changeItem(data);
                            }
                            ),
                      ),
                      ///desc text
                      CustomTextFormField(
                        controller: menuCubit.mealDescController,
                        hint: AppStrings.mealDesc.tr(context),
                        validate: (data){
                          if(data!.isEmpty){
                            return AppStrings.pleaseEnterValidMealDesc .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primary,
                                groupValue: menuCubit.groupVal,
                                value: 'quantity',
                                onChanged: (val){
                                  menuCubit.changeGroupVal(val);
                                },
                              ),
                              Text(AppStrings.mealQuantity.tr(context))
                            ],
                              ),
                          Spacer(),
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primary,
                                groupValue: menuCubit.groupVal,
                                value: 'number',
                                onChanged: (val){
                                  menuCubit.changeGroupVal(val);
                                },
                              ),
                            ],
                          ),
                          Text(AppStrings.mealNumber.tr(context))
                        ],
                      ),
            SizedBox(
                width: double.infinity,
                child: state is AddDishLoadingState?CustomLoadingIndicator()
                    : ElevatedButton(
                    onPressed: (){
                      if(menuCubit.addToMenuKey.currentState!.validate()){
                        menuCubit.addDishToMenu();
                      }
                    },
                    child: Text(AppStrings.addToMenu.tr(context)
                    ),
                ),
            ),
                    ],
                ),
                 );

    },
            ),
          ),
        ),
      ),
      )
    );
  }
}