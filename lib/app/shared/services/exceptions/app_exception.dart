class AppException implements Exception {
  final _message;

  AppException(this._message);

  String toString() {
    return _message;
  }
}

class BadRequestException extends AppException {
  BadRequestException({message})
      : super(message != null
            ? message
            : "Ocorreu um erro. Tente novamente mais tarde!");
}

class UnauthorizedException extends AppException {
  UnauthorizedException() : super("Usuário e/ou senha incorretos");
}
