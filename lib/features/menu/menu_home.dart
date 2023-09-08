import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index)=>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        //image
                      SizedBox(
                          height: 60,
                          width: 60,
                          child: CachedNetworkImage(
                            imageUrl: "https://d1sve9khgp0cw0.cloudfront.net/wp-content/uploads/2022/07/TnuIO7SFeYV03YQCpucl-I9Rdxo.jpg",
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
                            Text('Title'),
                            Text('SubTitle'),
                            Text('Price LE'),
                          ],
                        ),
                        Spacer(),
                        IconButton(
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
                                        
                                      },
                                      child: Text(AppStrings.ok.tr(context),style: TextStyle(fontSize: 16,color: AppColors.black),))
                                ],
                              );
                            }
                            );
                          },
                          icon: Icon(Icons.cancel,color: AppColors.red,size: 40,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}