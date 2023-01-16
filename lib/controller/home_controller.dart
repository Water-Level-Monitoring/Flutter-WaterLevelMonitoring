import 'package:flutter_waterlevel/data/service.dart';

class HomeController {
  Api api = Api();

  Stream<int> getSensor1() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final data = await api.getData();
      int? sensor1 = data[0].sensor1;
      yield sensor1!;
    }
  }

  Stream<int> getSensor2() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final data = await api.getData();
      int? sensor2 = data[0].sensor2;
      yield sensor2!;
    }
  }
}
