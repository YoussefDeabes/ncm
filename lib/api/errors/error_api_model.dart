import 'package:dio/dio.dart';
import 'package:ncm/api/errors/error_api_helper.dart';
import 'package:ncm/api/errors/locale_dio_exceptions.dart';


class ErrorApiModel {
  final bool isMessageLocalizationKey;
  final String message;
  final int code;
  ErrorApiModel({
    required this.isMessageLocalizationKey,
    required this.message,
    required this.code,
  });

  factory ErrorApiModel.fromDioError(DioError dioError) {
    late int codeError;
    switch (dioError.type) {
      case DioErrorType.cancel:
        codeError = 1001;
        break;
      case DioErrorType.connectTimeout:
        codeError = 1002;
        break;
      case DioErrorType.receiveTimeout:
        codeError = 1003;
        break;
      case DioErrorType.response:
      // use code from 1004 - 1010
        codeError = ErrorApiHelper.handleResponseErrorCode(
          dioError.response?.statusCode,
        );
        break;
      case DioErrorType.sendTimeout:
        codeError = 1011;

        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          codeError = 1012;
          break;
        }
        codeError = 1013;
        break;
      default:
        codeError = 1014;
        break;
    }
    if (codeError <= 1004 || codeError >= 1010) {
      return ErrorApiModel.fromJson(dioError);
    } else {
      return ErrorApiModel(
          code: codeError,
          isMessageLocalizationKey: true,
          message: LocaleDioExceptions.getLocaleMessage(codeError));
    }
  }

  factory ErrorApiModel.identifyError({dynamic error}) {
    ErrorApiModel errorApiModel;
    String? stackTrace = "";
    if (error is TypeError) {
      stackTrace = error.stackTrace.toString();
      errorApiModel = ErrorApiModel(
          code: 1015,
          message:
          ErrorApiHelper.formErrorMessage(error.toString(), stackTrace),
          isMessageLocalizationKey: false);
    } else {
      errorApiModel = ErrorApiModel(
          code: 1015,
          message: LocaleDioExceptions.getLocaleMessage(1015),
          isMessageLocalizationKey: true);
    }
    return errorApiModel;
  }

  factory ErrorApiModel.fromJson(DioError error) {
    Map<String, dynamic> extractedData =
    error.response?.data as Map<String, dynamic>;
    return ErrorApiModel(
        code: error.response?.statusCode ?? 1007,
        message: extractedData["Message"],
        isMessageLocalizationKey: false);
  }
}