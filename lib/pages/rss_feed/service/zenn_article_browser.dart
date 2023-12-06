import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future<void> onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future<void> onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future<void> onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
