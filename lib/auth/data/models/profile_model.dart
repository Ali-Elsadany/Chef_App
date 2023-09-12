import '../../../core/database/api/end_points.dart';

class GetDataChefModel {
  final String name;
  final String email;

  GetDataChefModel({
    required this.email,
    required this.name,
  });

  factory GetDataChefModel.fromJson(Map<String, dynamic> json) {
    return GetDataChefModel(
      name: json[ApiKey.name],
      email: json[ApiKey.email],
    );
  }
}
