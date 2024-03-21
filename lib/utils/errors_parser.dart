import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class ErrorParser {
  // Parses API errors
  static String parseApiError(Object error) {
    if (error is TimeoutException) {
      return 'Operation timed out. Please check your internet connection.';
    } else if (error is SocketException) {
      return 'Network error. Please check your internet connection.';
    } else if (error is http.ClientException) {
      return 'HTTP client error. Please check your internet connection.';
    } else {
      return 'An unexpected error occurred. Please try again later.';
    }
  }
}
