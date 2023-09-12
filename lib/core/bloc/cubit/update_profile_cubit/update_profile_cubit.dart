import 'package:chef_app/core/bloc/cubit/update_profile_cubit/update_profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../auth/data/repository/update_profile_repository.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateRepo,) : super(UpdateProfileInitial());
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minimumChargeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final UpdateProfileRepository updateRepo;
  //XFile? image;


  void updateProfile() async {
    emit(UpdateProfileLoadingState());
    final result = await updateRepo.updateProfile(
        name: nameController.text,
        phone: phoneController.text,
        brandName: brandNameController.text,
        minCharge: minimumChargeController.text,
        disc: descController.text,
        location:locationController.text ,
       // image: image!,

    );
    result.fold(
            (l) => emit(UpdateProfileErroringState()),
            (r) {
      emit(UpdateProfileSuccessState());
    });
  }
  //void takeImage(value) {
    //image = value;
    //emit(ChangeImage());
  //}

}