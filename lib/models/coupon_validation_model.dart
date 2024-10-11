
class CouponModel {
    bool? success;
    String? message;
    String? instance;
    dynamic data;

    CouponModel({this.success, this.message, this.instance, this.data});

    CouponModel.fromJson(Map<String, dynamic> json) {
        if(json["success"] is bool) {
            success = json["success"];
        }
        if(json["message"] is String) {
            message = json["message"];
        }
        if(json["instance"] is String) {
            instance = json["instance"];
        }
            data = json["data"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["message"] = message;
        _data["instance"] = instance;
        _data["data"] = data;
        return _data;
    }
}