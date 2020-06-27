class SignUpRequestModel {
  String federalId;
  String firstName;
  String lastName;
  String companyRegisterNumber;
  String companyName;
  String companyTradingName;
  String jobArea;
  String email;
  String password;

  SignUpRequestModel();

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    federalId = json['federalId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    companyRegisterNumber = json['companyRegisterNumber'];
    companyName = json['companyName'];
    companyTradingName = json['companyTradingName'];
    jobArea = json['jobArea'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['federalId'] = this.federalId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['companyRegisterNumber'] = this.companyRegisterNumber;
    data['companyName'] = this.companyName;
    data['companyTradingName'] = this.companyTradingName;
    data['jobArea'] = this.jobArea;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
