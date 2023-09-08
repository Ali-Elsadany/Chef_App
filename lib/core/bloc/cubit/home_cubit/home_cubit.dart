import 'package:chef_app/features/menu/menu_home.dart';
import 'package:chef_app/features/profile/profile_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens = [MenuScreen(),ProfileHomeScreen()];
  int currentIndex = 0;
  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexState());
  }
}