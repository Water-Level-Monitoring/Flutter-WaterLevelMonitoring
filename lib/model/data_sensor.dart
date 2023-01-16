class SensorModel {
  int? id;
  int? sensor1;
  int? sensor2;
  int? waterpump1;
  int? waterpump2;
  String? waktu;

  SensorModel(
      {this.id,
      this.sensor1,
      this.sensor2,
      this.waterpump1,
      this.waterpump2,
      this.waktu});

  SensorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sensor1 = json['sensor1'];
    sensor2 = json['sensor2'];
    waterpump1 = json['waterpump1'];
    waterpump2 = json['waterpump2'];
    waktu = json['waktu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> SensorModel = Map<String, dynamic>();
    SensorModel['id'] = id;
    SensorModel['sensor1'] = sensor1;
    SensorModel['sensor2'] = sensor2;
    SensorModel['waterpump1'] = waterpump1;
    SensorModel['waterpump2'] = waterpump2;
    SensorModel['waktu'] = waktu;
    return SensorModel;
  }
}
