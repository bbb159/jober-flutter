import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/pages/company_identifier_page.dart';
import 'package:jober/app/modules/sign_up/pages/email_password_page.dart';
import 'package:jober/app/modules/sign_up/pages/job_area_page.dart';
import 'package:jober/app/modules/sign_up/pages/person_identifier_page.dart';
import 'package:jober/app/modules/sign_up/pages/person_type_page.dart';
import 'package:jober/app/modules/sign_up/pages/sign_up_successfull_page.dart';
import 'package:jober/app/modules/sign_up/pages/use_terms_page.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => SignUpController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PersonTypePage()),
        Router('/person-identifier', child: (_, __) => PersonIdentifierPage()),
        Router('/company-identifier',
            child: (_, __) => CompanyIdentifierPage()),
        Router('/job-area', child: (_, __) => JobAreaPage()),
        Router('/email-password', child: (_, __) => EmailPasswordPage()),
        Router('/use-terms', child: (_, __) => UseTermsPage()),
        Router('/sign-up-sucessfull', child: (_, __) => SignUpSucessfulPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
