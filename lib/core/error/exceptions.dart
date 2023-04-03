// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Exception {
  final String? code;
  final String? message;

  Exception({
    this.code,
    this.message,
  });
}

class NoInternetConnectionException extends Exception {}

class LimitCategoryException extends Exception {
  @override
  final String? code;
  @override
  final String? message;

  LimitCategoryException({
    this.code,
    this.message,
  }) : super(code: code, message: message);
}
