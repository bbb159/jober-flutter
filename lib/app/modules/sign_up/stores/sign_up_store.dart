import 'package:jober/app/modules/sign_up/models/sign_up_request_model.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  UserType userType = UserType.PERSON;

  ObservableList<String> areas = ObservableList<String>.of([
    'Administração',
    'Direito',
    'Construção Civil',
    'Engenheria e Arquitetura',
    'Design',
    'Gastronomia',
    'Desenho Técnico',
    'Padeiro',
    'Pedreiro',
    'Faxineira',
    'Porteiro'
  ]);

  ObservableList<String> areasFiltered = ObservableList<String>.of([
    'Administração',
    'Direito',
    'Construção Civil',
    'Engenheria e Arquitetura',
    'Design',
    'Gastronomia',
    'Desenho Técnico',
    'Padeiro',
    'Pedreiro',
    'Faxineira',
    'Porteiro'
  ]);

  @observable
  String radioValue = 'Administração';

  SignUpRequestModel signUpRequest = SignUpRequestModel();
}
