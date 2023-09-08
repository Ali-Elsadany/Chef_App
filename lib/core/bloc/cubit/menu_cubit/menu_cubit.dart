import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  XFile? image ;
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealDescController= TextEditingController();
  GlobalKey<FormState> addToMenuKey = GlobalKey<FormState>();
  List categoryList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
  ];
  String selectedItem = 'Beef';
  void changeItem(item){
    selectedItem = item;
    emit(ChangeItemState());
  }
  String groupVal = 'quantity';
  void changeGroupVal(val){
    groupVal = val;
emit(ChangeGroupValState());
  }
}