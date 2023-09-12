import 'package:chef_app/core/bloc/cubit/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/data/models/profile_model.dart';
import '../../../../auth/data/repository/logout_repository.dart';
import '../../../../auth/data/repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getProfileRepo, this.logoutRepo) : super(ProfileInitial());
  final ProfileRepository getProfileRepo;

  GetDataChefModel? getChefModel;
  void getChefData() async {
    emit(GetChefDataLoadingState());
    final result = await getProfileRepo.getChefData();
    result.fold(
            (l) => emit(GetChefDataErrorState()),
            (r) {
          getChefModel=r;
          emit(GetChefDataSuccessState());
        });
  }
  //!logout
  final LogoutRepository logoutRepo;

  void logoutChef() async {
    emit(LogoutChefLoadingState());
    final result = await logoutRepo.logoutChef();
    result.fold(
            (l) => emit(LogoutChefErrorState()),
            (r) {
              emit(LogoutChefSuccessState());
            });
  }

}