class CouponModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  CouponModel({this.success, this.message, this.instance, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["instance"] is String) {
      instance = json["instance"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<CouponModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CouponModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["message"] = message;
    data["instance"] = instance;
    data["data"] = data;
    return data;
  }
}

class Data {
  dynamic value;

  Data({this.value});

  Data.fromJson(Map<String, dynamic> json) {
    // if(json["value"] is int) {
    value = json["value"];
    // }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    return data;
  }
}
