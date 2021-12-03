// To parse this JSON data, do
//
//     final thanaLists = thanaListsFromJson(jsonString);

import 'dart:convert';

ThanaLists thanaListsFromJson(String str) => ThanaLists.fromJson(json.decode(str));

String thanaListsToJson(ThanaLists data) => json.encode(data.toJson());

class ThanaLists {
  ThanaLists({
    this.status,
    this.data,
  });

  var status;
  List<ThanaData> data;

  factory ThanaLists.fromJson(Map<String, dynamic> json) => ThanaLists(
    status: json["status"],
    data: List<ThanaData>.from(json["data"].map((x) => ThanaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ThanaData {
  ThanaData({
    this.id,
    this.districtId,
    this.name,
  });

  var id;
  var districtId;
  var name;

  factory ThanaData.fromJson(Map<String, dynamic> json) => ThanaData(
    id: json["id"],
    districtId: json["district_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "district_id": districtId,
    "name": name,
  };
}
