import 'package:dio/dio.dart';
import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:flutter_application/base/model/base_data_dto.dart';
import 'package:flutter_application/base/model/base_data_list_dto.dart';
import 'package:flutter_application/base/model/error_dto.dart';
import 'package:get_it/get_it.dart';

class BaseApiService {
  Dio dio = GetIt.instance.get();

  Future<List<T>> handleGetList<T, K extends BaseBodyModel>({
    required String endPoint,
    required K bodyModel,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      final response = await dio.get(endPoint, queryParameters: bodyModel.toJson());
      final data = BaseDataListDto<T>.fromJson(
        response.data,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
      return data.data ?? [];
    } on DioError catch (error) {
      throw ErrorDto(
          errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }

  Future<T?> handleGetObject<T, K extends BaseBodyModel>({
    required String endPoint,
    required K bodyModel,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      final response = await dio.get(endPoint, queryParameters: bodyModel.toJson());
      final data = BaseDataDto<T>.fromJson(
        response.data,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
      return data.data;
    } on DioError catch (error) {
      throw ErrorDto(
          errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }

  Future<List<T>> handlePostList<T, K extends BaseBodyModel>({
    required String endPoint,
    required K bodyModel,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      final response = await dio.post(endPoint, data: bodyModel.toJson());
      final data = BaseDataListDto<T>.fromJson(
        response.data,
            (json) => fromJsonT(json as Map<String, dynamic>),
      );
      return data.data ?? [];
    } on DioError catch (error) {
      throw ErrorDto(
          errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }

  Future<T?> handlePostObject<T, K extends BaseBodyModel>({
    required String endPoint,
    required K bodyModel,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      final response = await dio.post(endPoint, data: bodyModel.toJson());
      final data = BaseDataDto<T>.fromJson(
        response.data,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
      return data.data;
    } on DioError catch (error) {
      throw ErrorDto(
          errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }
}
