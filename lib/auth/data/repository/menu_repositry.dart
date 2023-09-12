import 'package:chef_app/auth/data/models/meal_model.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/services/service_locator.dart';

class MenuRepository{
  Future<Either<String,String>> addDishToMenu({
   required XFile image,
   required String mealName,
   required String mealeDesc,
   required String mealCategory,
   required String howToSell,
   required double mealPrice,

  })async {
    try {
      final response = await sl<ApiConsumer>().post(
          EndPoint.addMeal,
          isFormData:true,
          data: {
        ApiKey.name: mealName,
        ApiKey.price: mealPrice,
        ApiKey.description: mealeDesc,
        ApiKey.category: mealCategory,
        ApiKey.howToSell: howToSell,
        ApiKey.mealImages: MultipartFile.fromFileSync(
            image.path,filename: image.path.split('/').last
        ),
      });
      return Right(response[ApiKey.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String,String>> deleteMeal({
   required String id,


  })async {
    try {
      final response = await sl<ApiConsumer>().delete(EndPoint.getdeleteMealEndPoint(id),
      );
      return Right(response[ApiKey.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String,GetAllMealModel>> getMeal()async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getAllChefMeals(sl<CacheHelper>().getData(key: ApiKey.id)),
          );
      return Right(GetAllMealModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}