class BaseException implements Exception{
  final int? code;
  final String message;
  const BaseException({required this.message,this.code});
}