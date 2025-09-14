import 'package:dio/dio.dart';
import '../resources/data_state.dart';

class CheckExceptions {
  CheckExceptions(Object? error);

  static Future<DataFailed<T>> response<T>(Response? response) async {
    switch (response?.statusCode ?? -1) {
      case 400:
        return DataFailed<T>(response?.data['message'] ?? "Bad request.");
      case 401:
        return DataFailed<T>(response?.data['message'] ?? "Unauthorized. Please log in again.");
      case 403:
        return DataFailed<T>(response?.data['message'] ?? "Forbidden request.");
      case 422:
        return DataFailed<T>(response?.data['message'] ?? "Unprocessable entity.");
      case 404:
        return DataFailed<T>(response?.data['message'] ?? "Resource not found.");
      case 500:
        return DataFailed<T>(response?.data['message'] ?? "Server error. Please try again later.");
      default:
        if (response != null) {
          return DataFailed<T>(
            response.data is Map && response.data.containsKey("message")
                ? response.data["message"]
                : "Unexpected error occurred!",
          );
        } else {
          return  DataFailed<T>("No response received from server.");
        }
    }
  }

  static Future<DataState<T>> getError<T>(Object error) async {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return  DataFailed<T>("Connection timeout. Please try again.");
        case DioExceptionType.sendTimeout:
          return  DataFailed<T>("Send timeout. Please try again.");
        case DioExceptionType.receiveTimeout:
          return  DataFailed<T>("Receive timeout. Please try again.");
        case DioExceptionType.badCertificate:
          return  DataFailed<T>("Bad SSL certificate.");
        case DioExceptionType.cancel:
          return  DataFailed<T>("Request was cancelled.");
        case DioExceptionType.connectionError:
          return  DataFailed<T>("No internet connection.");
        case DioExceptionType.badResponse:
          return response<T>(error.response);
        default:
          return  DataFailed<T>("Unexpected network error.");
      }
    } else {
      return  DataFailed<T>("An unknown error occurred.");
    }
  }
}
