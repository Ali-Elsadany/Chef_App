
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_cubit.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../auth/data/models/meal_model.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';
import '../core/widgets/custom_loading_indicator.dart';

class MenuItemComponent extends StatelessWidget {
  MenuItemComponent({super.key, required this.model});

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CachedNetworkImage(
            imageUrl: model.images[0],
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
//Image.network('https://d1sve9khgp0cw0.cloudfront.net/wp-content/uploads/2022/07/TnuIO7SFeYV03YQCpucl-I9Rdxo.jpg')
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 180,
                child: Text(model.name)),
            SizedBox(
                width: 180,
                child: Text(
                    model.description,
                  overflow: TextOverflow.ellipsis,
                )
            ),
            SizedBox(
                width: 180,
                child: Text(model.price.toString()+' '+AppStrings.le.tr(context))),
          ],
        ),
        Spacer(),
        BlocConsumer<MenuCubit,MenuState>(
          listener: (BuildContext context,MenuState state) {
            if(state is DeleteDishSucessState){
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
          },
          builder: (context,state) {
            return IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    //content
                    content: Text(
                      AppStrings.deleteDish.tr(context),
                      style: TextStyle(fontSize: 20,color: AppColors.black),
                    ),
                    //actions
                    actions: [
                      //cancel text
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text(AppStrings.cancel.tr(context),style: TextStyle(fontSize: 16,color: AppColors.black),
                          )
                      ),
                      //ok text
                      TextButton(
                          onPressed: (){
                            BlocProvider.of<MenuCubit>(context).deleteDish(model.id);
                            Navigator.pop(context);
                          },
                          child: Text(AppStrings.ok.tr(context),style: TextStyle(fontSize: 16,color: AppColors.black),))
                    ],
                  );
                }
                );
              },
              icon: Icon(Icons.cancel,color: AppColors.red,size: 40,),
            );
          }
        ),
      ],
    );
  }
}
// navigator.pop
//show circle Loading

