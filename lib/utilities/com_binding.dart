
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:get/get.dart';

class ComBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Api(), fenix: true);
    Get.put(AppSession());
  }
}

class AppSession extends GetxController {
  static AppSession get to => Get.find();
  // SessionManager sessionManager = SessionManager();
  // late SharedPreferences prefs;

//  var session = SessionManager();
  @override
  Future<void> onInit() async {
    // prefs= await SharedPreferences.getInstance();
    // await SessionManager().set(SessionKeys.TO_FIREBASE, null);
    // await SessionManager().update();
    super.onInit();
  }



  // Future<void> logout() async {
  //   Map<String, dynamic> myMsg = {
  //     'msg': '',
  //   };
  //   var langChoosed = await (AppSession.to.prefs.getString( SessionKeys.LANG_TYPE));
  //   FlutterBackgroundService().invoke(
  //     SessionKeys.LOGINCHECK,
  //     myMsg,
  //   );
  //   //GetStorage('Amj_db').write(SessionKeys.LANG_TYPE, langChoosed);
  //   // AppSession.to.session.destroy();
  //   prefs.clear();
  //   // await SessionManager().update();
  //   AppSession.to.prefs.setString(SessionKeys.LANG_TYPE, langChoosed??'');
  //   prefs.setString(SessionKeys.LANG_TYPE_MAIN, langChoosed??'');
  //   Get.offNamed(Routes.splash);
  // }
}
