part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class GetData extends LoginState {}

class RegisterLoading extends LoginState {}

class RegisterSuccess extends LoginState {}

class RegisterError extends LoginState {
  final String? error;

  RegisterError(this.error);
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel? loginModel;

  LoginSuccess(this.loginModel);
}

class LoginError extends LoginState {
  final String? error;

  LoginError(this.error);
}

class GetUniversityDataLoading extends LoginState {}

class GetUniversityDataSuccess extends LoginState {}

class GetUniversityDataError extends LoginState {
  final String? error;

  GetUniversityDataError(this.error);
}

class GetGradeDataLoading extends LoginState {}

class GenderSelected extends LoginState {}

class UniversitySelected extends LoginState {}

class GradeSelected extends LoginState {}

class ChangeVisibility1 extends LoginState {}

class ChangeVisibilitylogin extends LoginState {}

class ChangeVisibility2 extends LoginState {}

class GetGradeDataSuccess extends LoginState {}

class GetGradeDataError extends LoginState {
  final String? error;

  GetGradeDataError(this.error);
}
