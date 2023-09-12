import 'package:chef_app/core/bloc/cubit/profile_cubit/profile_cubit.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/bloc/cubit/menu_cubit/menu_cubit.dart';
import '../../core/bloc/cubit/menu_cubit/menu_state.dart';
import '../../core/bloc/cubit/update_profile_cubit/update_profile_cubit.dart';
import '../../core/bloc/cubit/update_profile_cubit/update_profile_state.dart';
import '../../core/commons/commons.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_file_image.dart';
import '../../core/widgets/custom_loading_indicator.dart';
import '../../core/widgets/custom_text_form_feild.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController brandName = TextEditingController();
  final TextEditingController minCharge = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController loc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.editProfile.tr(context)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Center(
                    child: BlocConsumer<UpdateProfileCubit,UpdateProfileState>(
                    listener: (context,state) {
                        if(state is UpdateProfileSuccessState){
                       // showToast(
                       // message: AppStrings.mealAddedSucessfully,
                       // state: ToastStates.success);
                          Navigator.pop(context);
                        BlocProvider.of<ProfileCubit>(context).getChefData();
                        }
                      },
                    builder: (context, state) {

                      return Form(
                        key: BlocProvider.of<UpdateProfileCubit>(context).updateProfileKey,
                      child: Column(
                        children: [
                          ///add photo
                          Stack(
                            children: [
                              //image
                              CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(AppAssets.ali),
                              ),
                             // CustomFileImage(
                                  // image: BlocProvider.of<UpdateProfileCubit>(context).image,

                             // ),
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
                                                      //Navigator.pop(context);
                                                     // pickImage(ImageSource.camera)
                                                       //   .then((value) => BlocProvider.of<UpdateProfileCubit>(context).takeImage(value));
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
                                                     // Navigator.pop(context);
                                                     // pickImage(ImageSource.gallery)
                                                        //  .then((value) => BlocProvider.of<UpdateProfileCubit>(context).takeImage(value));

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
                            controller: BlocProvider.of<UpdateProfileCubit>(context).nameController,
                            hint: AppStrings.name.tr(context),
                            validate: (data){
                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidName.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ///phone text
                          CustomTextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                            controller: BlocProvider.of<UpdateProfileCubit>(context).phoneController,
                            hint: AppStrings.phoneNumber.tr(context),
                            validate: (data){
                              if(num.tryParse(data!)==null){
                                return AppStrings.pleaseEnterValidPhone.tr(context);
                              }
                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidPhone.tr(context);
                              }
                              if(data.length<10){
                                return AppStrings.pleaseEnterValidPhoneAtLeastTenChar.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ///brand name text
                          CustomTextFormField(
                            controller: BlocProvider.of<UpdateProfileCubit>(context).brandNameController,
                            hint: AppStrings.brandName.tr(context),
                            validate: (data){

                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidBrandName.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ///min charge text
                          CustomTextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            controller: BlocProvider.of<UpdateProfileCubit>(context).minimumChargeController,
                            hint: AppStrings.minCharge.tr(context),
                            validate: (data){
                              if(num.tryParse(data!)==null){
                                return AppStrings.pleaseEnterValidMinCharge.tr(context);
                              }
                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidMinCharge.tr(context);
                              }
                              if(data.length<20){
                                return AppStrings.pleaseEnterValidChargeAtLeastTwentyChar.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ///desc
                          CustomTextFormField(
                            controller: BlocProvider.of<UpdateProfileCubit>(context).descController,
                            hint: AppStrings.description.tr(context),
                            validate: (data){
                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidDesc.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ///location
                          CustomTextFormField(
                            controller: BlocProvider.of<UpdateProfileCubit>(context).locationController,
                            hint: AppStrings.location.tr(context),
                            validate: (data){
                              if(data!.isEmpty){
                                return AppStrings.pleaseEnterValidLocation.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: state is UpdateProfileLoadingState?CustomLoadingIndicator()
                                :ElevatedButton(
                              onPressed: (){
                                if(BlocProvider.of<UpdateProfileCubit>(context).updateProfileKey.currentState!.validate()){
                                  BlocProvider.of<UpdateProfileCubit>(context).updateProfile();
                                }
                              },
                              child: Text(AppStrings.update.tr(context)
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