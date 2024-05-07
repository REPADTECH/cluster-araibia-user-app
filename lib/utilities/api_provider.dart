import 'package:cluster_arabia/models/login_model.dart';
import 'package:cluster_arabia/models/otp_verify_model.dart';
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/models/student_by_id.dart';
import 'package:cluster_arabia/models/student_list_model.dart';
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

  Future<OtpModelClass> otpVerifyOtp({
    required String otpToken,
    required String otp,
  }) {
    return post(
      'p/auth/login/otp/verify',
      FormData(
        {
          'otp_token': otpToken,
          'otp': otp,
        },
      ),
    ).then((value) {
      return OtpModelClass.fromJson(value.body ?? err);
    });
  }

  Future<ProfileModel> getProfile() {
    return get('p/auth/profile').then((value) {
      return ProfileModel.fromJson(value.body ?? err);
    });
  }

  Future<StudentModelList> getStudentsList({
    var search,
    var routeId,
    var pickUpId,
    var country,
    var state,
    var schoolId,
    required var status,
    required var page,
  }) {
    return get(
            'p/student/list/$page?search=$search&route_id=$routeId&pickup_id=$pickUpId&country=$country&state=$state&school_id=$schoolId&status=$status')
        .then((value) {
      return StudentModelList.fromJson(value.body ?? err);
    });
  }

  Future<StudentViewById> getStudentById({
    required var studentId,
  }) {
    return get('p/student/view/$studentId').then((value) {
      return StudentViewById.fromJson(value.body ?? err);
    });
  }
}
