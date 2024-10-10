import 'package:flutter/foundation.dart';

/// ═══════════════════════════╣ OMS_DOC ╠═══════════════════════════
///
/// don't change the `baseURL` concept. only change values if required
///
/// ═══════════════════════════════════ ══════════════════════════════
var baseURL = (kReleaseMode)
    ? "https://app.racotransport.com/" // for release running
  : "https://cluster.arabia.test.repad.dev/"; // for debug running
  //  : "https://pleased-uniquely-bat.ngrok-free.app/"; // for debug running