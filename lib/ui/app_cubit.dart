import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuemate/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  //add method login
  Future<void> login(String userName, String password) async {
    emit(AppStateLoading());
    //logic login
    emit(AppStateLoginSuccess(true));
  }

  //add method logout
  Future<void> logout() async {
    emit(AppStateLoading());
    //logic logout
    emit(AppStateLoginSuccess(false));
  }

  Future<void> loginSns() async {
    //logic update first login
    emit(AppStateLoginSuccess(true));
  }

  // void updateFirstLogin() {
  //   emit(AppStateUpdateFirstLogin(false));
  // }
}
