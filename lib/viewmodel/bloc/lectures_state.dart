part of 'lectures_cubit.dart';

abstract class LecturesState {}

class LecturesInitial extends LecturesState {}
class GetData extends LecturesState {}
class GetLecturesSuccessState extends LecturesState {}

class GetLecturesErrorState extends LecturesState {
  final String error;

  GetLecturesErrorState(this.error);
}

class GetLecturesLoadingState extends LecturesState {}

class getNewsDataLoading extends LecturesState{}
class getNewsDataSuccess extends LecturesState{}
class getNewsDataError extends LecturesState{
  final String? error;
  getNewsDataError(this.error);
}

