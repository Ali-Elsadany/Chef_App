import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/auth/data/models/meal_model.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_cubit.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_state.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/menu_item_component.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_strings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // add dish button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    navigate(context: context, route: Routes.addMeal);
                  },
                  child: Text(AppStrings.addDishToMenu.tr(context)),),
              ),
              // item
              BlocBuilder<MenuCubit,MenuState>(
                builder: (context,state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                  return Expanded(
                    child: state is GetAllChefMealsLoadingState? CustomLoadingIndicator():menuCubit.meals.isEmpty
                        ? Center(child: Text(AppStrings.noMeals.tr(context)))
                        :ListView.builder(
                      itemCount: menuCubit.meals.length,
                      itemBuilder: (context,index)=>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MenuItemComponent(model: menuCubit.meals[index],),
                        ),
                      ),
                    );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}