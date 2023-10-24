import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  @override
  List<Object> get props => [];

  bool get isLogined => false;

  bool get isFirstLogin => true;
}

class AppInitial extends AppState {}

class AppStateLoading extends AppState {}

// ignore: must_be_immutable
class AppStateLoginSuccess extends AppState {
  @override
  bool isLogined;

  AppStateLoginSuccess(this.isLogined);
  @override
  List<Object> get props => [isLogined];
}
