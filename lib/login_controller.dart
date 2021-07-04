class LoginController {
  String email = '';
  String password = '';

  void onChanged({String? email, String? password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    print('Email ${this.email}, password ${this.password}');
  }

  bool login(String newPassword) {
    if (email == 'email@raro.com' && password == newPassword) {
      return true;
    } else {
      return false;
    }
  }
}
