import 'package:news_app/core/data/api_manager/models/response_model.dart';

class GenericApiResponseModel extends ResponseModel {
  GenericApiResponseModel({
    required this.responseCode,
    required this.responseMessage,
    required this.success,
    required this.errorMessage,
  });

  factory GenericApiResponseModel.fromMap(Map<String, dynamic> map) {
    return GenericApiResponseModel(
      responseCode: map['response_code'] as int?,
      responseMessage: map['response_message'] as String?,
      success: map['success'] as bool?,
      errorMessage: map['error_message'] as String?,
    );
  }
  final int? responseCode;
  final String? responseMessage;
  final bool? success;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        responseCode,
        responseMessage,
        success,
        errorMessage,
      ];
}
