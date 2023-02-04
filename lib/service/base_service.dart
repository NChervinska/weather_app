import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../resources/app_strings.dart';

abstract class BaseService {
  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioError catch (exception) {
      throw await _getProccessedDioError(exception);
    } catch (exception, stackTrace) {
      log(
        exception.toString(),
        name: exception.runtimeType.toString(),
        error: exception.toString(),
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  Future<Exception> _getProccessedDioError(DioError exception) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return Exception(AppStrings.noInternetConnection);
    }

    final unknownApiException = Exception(AppStrings.serverErrorMessage);

    try {
      final response = exception.response?.data;

      if (response == null) {
        return unknownApiException;
      }

      return Exception(response['message']);
    } catch (_) {
      return unknownApiException;
    }
  }
}
