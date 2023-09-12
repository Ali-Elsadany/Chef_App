import 'package:dartz/dartz.dart';

import '../../../core/database/api/api_consumer.dart';
import '../../../core/database/api/end_points.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/services/service_locator.dart';

class UpdatePasswordRepository {
  Future<Either<String, String>> changePassword({
    required String oldPass,
    required String newPass,
    required String confirmPassword,
  }) async {
    try {
      final responese = await sl<ApiConsumer>().patch(
        EndPoint.chefChangePassword,
        data: {
          ApiKey.oldPass: oldPass,
          ApiKey.newPass: newPass,
          ApiKey.confirmPassword: confirmPassword,
        },
      );
      return Right(responese[ApiKey.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}