import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:flutter_application/base/model/base_data_list_dto.dart';
import 'package:flutter_application/base/model/error_dto.dart';
import 'package:flutter_application/constants/end_point/end_point.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/data/dto/notification_dto.dart';
import 'package:flutter_application/utils/local_log.dart';

class NotificationService extends BaseApiService {
  Future<List<NotificationDto>> getNotificationUnread(BaseBodyModel searchModel) async {
    try {
      final response = await dio.get(EndPoint.notificationUnread);
      final List<NotificationDto> dataList = [];
      if (response.data['Status'] == true) {
        for (var element in response.data['Data']) {
          dataList.add(NotificationDto.fromJson(element as Map<String, dynamic>));
        }
      }

      return dataList;
    } on DioError catch (error) {
      if (error.response?.statusCode == 500) {
        throw ErrorDto(
            errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
      } else {
        throw ErrorDto.fromJson(jsonDecode(error.response.toString()));
      }
    } catch (exception) {
      localLog(exception: exception, name: 'NotificationService');
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }

  Future<List<NotificationDto>> getAllNotification(BaseBodyModel searchModel) async {
    try {
      final response = await dio.get(EndPoint.notifications, queryParameters: searchModel.toJson());
      final data = BaseDataListDto<NotificationDto>.fromJson(
        response.data['Data'],
        (json) => NotificationDto.fromJson(json as Map<String, dynamic>),
      );
      return data.data ?? [];
    } on DioError catch (error) {
      if (error.response?.statusCode == 500) {
        throw ErrorDto(
            errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
      } else {
        throw ErrorDto.fromJson(jsonDecode(error.response.toString()));
      }
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }

  Future<bool> readNotification(int notificationId) async {
    try {
      final response = await dio.get(EndPoint.readNotification, queryParameters: {"idNotification": notificationId});
      if (response.data['Status'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == 500) {
        throw ErrorDto(
            errors: [], message: "${error.error} -- ${error.response?.data}", statusCode: error.response?.statusCode);
      } else {
        throw ErrorDto.fromJson(jsonDecode(error.response.toString()));
      }
    } catch (exception) {
      if (exception is ErrorDto) {
        rethrow;
      } else {
        throw ErrorDto(message: exception.toString(), errors: [], statusCode: -1);
      }
    }
  }
}
