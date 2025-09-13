import 'package:dio/dio.dart';
import '../resources/data_state.dart';

class CheckExceptions {
  CheckExceptions(Object? error);

  static Future<DataState> response(Response? response) async {
    switch (response?.statusCode ?? -1) {
      case 400:
        return DataFailed(response?.data['message'] ?? "Bad request.");
      case 401:
        return DataFailed(response?.data['message'] ?? "Unauthorized. Please log in again.");
      case 403:
        return DataFailed(response?.data['message'] ?? "Forbidden request.");
      case 404:
        return DataFailed(response?.data['message'] ?? "Resource not found.");
      case 500:
        return DataFailed(response?.data['message'] ?? "Server error. Please try again later.");
      default:
        if (response != null) {
          return DataFailed(
            response.data is Map && response.data.containsKey("message")
                ? response.data["message"]
                : "Unexpected error occurred!",
          );
        } else {
          return const DataFailed("No response received from server.");
        }
    }
  }

  static Future<DataState> getError(Object error) async {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const DataFailed("Connection timeout. Please try again.");
        case DioExceptionType.sendTimeout:
          return const DataFailed("Send timeout. Please try again.");
        case DioExceptionType.receiveTimeout:
          return const DataFailed("Receive timeout. Please try again.");
        case DioExceptionType.badCertificate:
          return const DataFailed("Bad SSL certificate.");
        case DioExceptionType.cancel:
          return const DataFailed("Request was cancelled.");
        case DioExceptionType.connectionError:
          return const DataFailed("No internet connection.");
        case DioExceptionType.badResponse:
          return response(error.response);
        default:
          return const DataFailed("Unexpected network error.");
      }
    } else {
      return const DataFailed("An unknown error occurred.");
    }
  }
}
