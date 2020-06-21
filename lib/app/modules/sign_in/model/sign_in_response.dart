class SignInResponse {
  String _jwt;

  SignInResponse({String jwt}) {
    this._jwt = jwt;
  }

  String get jwt => _jwt;
  set jwt(String jwt) => _jwt = jwt;

  SignInResponse.fromJson(Map<String, dynamic> json) {
    _jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this._jwt;
    return data;
  }
}
