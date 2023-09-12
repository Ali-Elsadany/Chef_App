
import 'package:chef_app/auth/data/models/meal_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../auth/data/repository/menu_repositry.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(MenuInitial());
  final MenuRepository menuRepository;
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
  void addDishToMenu()async{
    emit(AddDishLoadingState());
    final res = await menuRepository.addDishToMenu(
        image: image!,
        mealName: mealNameController.text,
        mealeDesc: mealDescController.text,
        mealCategory: selectedItem,
        howToSell: groupVal,
        mealPrice: double.parse(mealPriceController.text)
    );
    res.fold(
            (l) => emit(AddDishErrorState()),
            (r) => emit(AddDishSucessState()));
  }
  void deleteDish(id)async{
    emit(DeleteDishLoadingState());
    final res = await menuRepository.deleteMeal(
        id: id,
    );
    res.fold(
            (l) => emit(DeleteDishErrorState()),
            (r) => emit(DeleteDishSucessState()));
  }
  List<MealModel> meals = [];

  void getAllMeals() async {
    emit(GetAllChefMealsLoadingState());
    final res = await menuRepository.getMeal();
    res.fold(
            (l) => emit(GetAllChefMealsErrorState()),
            (r) {
               meals = r.meals;
               emit(GetAllChefMealsSucessState());
            }
    );
  }
  void takeImage(value){
    image=value;
    emit(TakeImageFromUser());
  }
}
