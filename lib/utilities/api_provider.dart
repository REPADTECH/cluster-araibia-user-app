import 'package:cluster_arabia/models/login_model.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
//------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseURL;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] =
          AppSession.to.session.read(SessionKeys.API_KEY) ?? '';
      request.headers['ngrok-skip-browser-warning'] = "skip";
      return request;
    });
  }

  Future<LoginModel> userLogin({
    required String phone,
  }) {
    return post(
      'p/auth/login/otp/request',
      FormData(
        {
          'mobile_or_email': phone,
        },
      ),
    ).then((value) {
      return LoginModel.fromJson(value.body ?? err);
    });
  }
}
