// To parse this JSON data, do
//
//     final districts = districtsFromJson(jsonString);

import 'dart:convert';

DistrictsLists districtsFromJson(String str) => DistrictsLists.fromJson(json.decode(str));

String districtsToJson(DistrictsLists data) => json.encode(data.toJson());

class DistrictsLists {
  DistrictsLists({
    this.status,
    this.data,
  });

  var status;
  List<Dis> data;

  factory DistrictsLists.fromJson(Map<String, dynamic> json) => DistrictsLists(
    status: json["status"],
    data: List<Dis>.from(json["data"].map((x) => Dis.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Dis {
  Dis({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory Dis.fromJson(Map<String, dynamic> json) => Dis(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
