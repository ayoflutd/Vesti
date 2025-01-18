
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti/view/signin/state/signin_state.dart';

class SignInNotifer extends StateNotifier<SignInState>{
  SignInNotifer():super(SignInState());

  void onChangeEmail(String email){
    state = state.copyWith(email: email);
  }

  void onChangePassword(String password){
    state = state.copyWith(password: password);
  }
}

class PasswordEnabled extends StateNotifier<bool>{
  PasswordEnabled():super(true);

  void onChangePassword(){
    final newMode = state == false ? true : false;
    state = newMode;
  }
}

final signinNotifierProvider = StateNotifierProvider<SignInNotifer, SignInState>((ref)=>SignInNotifer());
final passwordNotifierProvider = StateNotifierProvider<PasswordEnabled, bool>((ref)=>PasswordEnabled());