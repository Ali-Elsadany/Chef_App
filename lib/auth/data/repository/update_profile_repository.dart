import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/commons/commons.dart';
import '../../../core/database/api/api_consumer.dart';
import '../../../core/database/api/end_points.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/services/service_locator.dart';

class UpdateProfileRepository{
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    required String brandName,
    required String minCharge,
    required String disc,
    required var location,
    //required XFile image,

  }) async {
    try {
      final responese = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        isFormData:true,
        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.brandName: brandName,
          ApiKey.minCharge: minCharge,
          ApiKey.disc: disc,
          ApiKey.location: location,
          //ApiKey.profilePic:MultipartFile.fromFileSync(image.path,
      //filename: image.path.split('/').last) ,

        },
      );
      return Right(responese[ApiKey.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}