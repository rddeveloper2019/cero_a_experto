import 'package:cero_a_experto/domain/entities/message.dart';
import 'package:cero_a_experto/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio(BaseOptions(baseUrl: 'https://yesno.wtf/'));
  Future<Message> getAnswer() async {
    final response = await _dio.get('api');
    return YesNoModel.fromMap(response.data).toMessageEntity();
  }
}
