import 'package:chef_app/auth/data/models/login_model.dart';
import 'package:chef_app/auth/data/repository/auth_repositry.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../services/service_locator.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;
  GlobalKey<FormState> loginKey=GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon(){
    isLoginPasswordShowing =! isLoginPasswordShowing;
    suffixIcon=isLoginPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  // login method
  LoginModel? loginModel;
void login()async{
    emit(LoginLoadingState());
   final result = await authRepo.login(
        email: emailController.text,
        password: passwordController.text
   );
   result.fold(
           (l) => emit(LoginErrorState(l)),
           (r) async{
             loginModel=r;
             Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
             await sl<CacheHelper>().saveData(key: ApiKey.id, value: decodedToken['id']);
             //
            await sl<CacheHelper>().saveData(
                 key: ApiKey.token,
                 value: r.token
             );
         emit(LoginSucessState());
       }
   );
}
}