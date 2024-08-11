class AppException implements Exception {
  final String? _message;
  final String? _title;

  AppException([this._message, this._title]);

  @override
  String toString() {
    return "$_title : $_message";
  }
}

class InternetException extends AppException {
  InternetException([String message = '']) : super(message, "No Internet");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String message = '']) : super(message, "Request Time Out");
}

class ServerException extends AppException{
  ServerException([String message = '']):super(message, "Internal Server Error");
}

class TimeOutException extends AppException{
  TimeOutException([String message = '']):super(message, "Server Timeout Error");
}

class FetchDataException extends AppException{
  FetchDataException([String message = '']):super(message, "Data Fetch Error");
}