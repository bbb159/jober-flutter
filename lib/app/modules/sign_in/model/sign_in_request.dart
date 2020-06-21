class SignInRequest {
  String _email;
  String _password;

  SignInRequest({String email, String password}) {
    this._email = email;
    this._password = password;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;

  SignInRequest.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['password'] = this._password;
    return data;
  }
}
