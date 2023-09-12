sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdateNewPasswordSuffixIcon extends UpdatePasswordState {}

final class UpdateOldPasswordSuffixIcon extends UpdatePasswordState {}

final class ConfirmPasswordSuffixIcon extends UpdatePasswordState {}

final class UpdatePasswordLoadingState extends UpdatePasswordState {}

final class UpdatePasswordSuccessState extends UpdatePasswordState {
  final String message;

  UpdatePasswordSuccessState(this.message);
}
final class UpdatePasswordErrorState extends UpdatePasswordState {
  final String message;

  UpdatePasswordErrorState(this.message);
}
