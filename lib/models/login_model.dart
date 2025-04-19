import 'package:bomber_app/shared/validator/validator.dart';

class LoginModel {
  GeneralField ci;
  Password password;

  LoginModel({
    this.ci = const GeneralField.pure(),
    this.password = const Password.pure(),
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      ci: GeneralField.dirty(json['ci'] ?? ''),
      password: Password.dirty(json['password'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {'ci': ci.value, 'password': password.value};
  }

  //copy with

  LoginModel copyWith({GeneralField? ci, Password? password}) {
    return LoginModel(ci: ci ?? this.ci, password: password ?? this.password);
  }
}
