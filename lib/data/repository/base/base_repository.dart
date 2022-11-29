import 'package:my_home/data/local_source/local_source.dart';
import 'package:my_home/data/provider/api_client.dart';
import 'package:my_home/data/provider/server_error.dart';

abstract class BaseRepository {
  final ApiClient apiClient = ApiClient.getInstance();
  final LocalSource localSource = LocalSource();

  Future<String> getErrorMessage(String message) async {
    String errorMessage = '';
    switch (message) {
      case "Connection timeout":
        errorMessage = 'Время соединения вышло';
        break;
      default:
        errorMessage = 'Something went wrong! :(';
    }
    return errorMessage;
  }

  bool checkIsCancelled(ServerError? value) {
    return (value?.getErrorMessage() ?? '') != 'Canceled';
  }
}
