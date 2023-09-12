sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class UpdateProfileErroringState extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {}

final class ChangeImage extends UpdateProfileState {}