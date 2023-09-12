sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetChefDataLoadingState extends ProfileState {}

final class GetChefDataSuccessState extends ProfileState {}

final class GetChefDataErrorState extends ProfileState {}

final class LogoutChefLoadingState extends ProfileState {}

final class LogoutChefSuccessState extends ProfileState {}

final class LogoutChefErrorState extends ProfileState {}