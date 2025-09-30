import 'package:bomber_app/api/api.dart' show ApiAuth;
import 'package:bomber_app/config/router/path_router.dart';
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/shared/validator/validator.dart';
import 'package:bomber_app/utils/general_utils.dart';

import 'package:bomber_app/utils/utils.dart' show SnackbarCustom;
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class LoginProvider extends _$LoginProvider {
  bool isValid = false;
  @override
  LoginModel build() {
    return LoginModel();
  }

  void setEmail(String email) {
    state = state.copyWith(ci: GeneralField.dirty(email));
    isValid = Formz.validate([state.ci, state.password]);
  }

  void setPassword(String password) {
    state = state.copyWith(password: Password.dirty(password));
    isValid = Formz.validate([state.password, state.ci]);
  }

  Future<void> login(BuildContext context) async {
    if (!isValid) {
      SnackbarCustom.showCustomSnackBar(
        context: context,
        message: 'Complete todos los campos',
        isNormal: false,
      );
      return;
    }
    final apiAuth = ApiAuth();
    final response = await apiAuth.login(state.ci.value, state.password.value);
    if (response['ok'] == true) {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: 'Login exitoso',
        isNormal: true,
      );
      final userModel = UserModel.instance;
      GeneralUtils.setToken(userModel.token);
      await GeneralUtils.setUserId(userModel.personal.idPersonal.toString());
      final saveToken = UpdateNotificationToken();
      await saveToken.updateNotificationToken();
      // ignore: use_build_context_synchronously
      context.go(PathRouter.home);
    } else {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: response['message'],
        isNormal: false,
      );
    }
  }

  Future<void> getCurrentUser(String userId, BuildContext context) async {
    final apiAuth = ApiAuth();
    final response = await apiAuth.getInformationUser(userId);
    if (response['ok'] == true) {
      final userModel = UserModel.instance;
      GeneralUtils.setToken(userModel.token);
      await GeneralUtils.setUserId(userModel.personal.idPersonal.toString());
      final saveToken = UpdateNotificationToken();
      await saveToken.updateNotificationToken();
      // ignore: use_build_context_synchronously
      context.go(PathRouter.home);
    } else {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: 'Vuelva a iniciar sesión',
        isNormal: false,
      );
      GeneralUtils.deleteDataCache();
      // ignore: use_build_context_synchronously
      context.go(PathRouter.pageStart);
    }
  }

  Future<void> logout(BuildContext context) async {
    GeneralUtils.deleteDataCache();
    // ignore: use_build_context_synchronously
    context.go(PathRouter.pageStart);
  }
}

class UpdateNotificationToken {
  Future<void> updateNotificationToken() async {
    final id = await GeneralUtils.getUserId();
    final token = await GeneralUtils.saveToken();
    print('token: $token');
    final apiAuth = ApiAuth();
    final userModel = UserModel.instance;
    userModel.personal.notificationToken = token;
    print('token: ${userModel.personal.notificationToken}');
    await apiAuth.saveNotificationToken(id!, token!);
  }
}

class DeleteAccount {
  Future<Map<String, dynamic>> deleteAccount(String id, String token) async {
    final apiAuth = ApiAuth();
    return await apiAuth.deleteAccount(id, token);
  }
}
