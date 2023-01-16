import 'package:dio/dio.dart';
import 'package:flutter_waterlevel/model/data_sensor.dart';

class Api {
  Future<List<SensorModel>> getData() async {
    try {
      var response = await Dio().get(
          'https://api-waterlevelmonitoring-production.up.railway.app/sensor/lastId');
      print(response);
      final data = ((response.data['data'] ?? []) as List)
          .map((e) => SensorModel.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
