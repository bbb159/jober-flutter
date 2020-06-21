import 'package:jober/app/modules/sign_up/models/company_type_enum.dart';
import 'package:jober/app/modules/sign_up/models/user_profile.model.dart';

class CompanyPersonModel extends UserProfileModel {
  int id;
  String registerNumber;
  String companyName;
  String tradingName;
  CompanyType companyType;
}
