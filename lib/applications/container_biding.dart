import 'dart:io';
import 'package:flutter/foundation.dart';

import 'injection_container.dart';

/// DIコンテナにバインディングする
class InjectionContainerBinding {
  static void bind() {
    final container = InjectionContainer();

    // 共通でバインドする項目
    _bindShared(container);

    // プラットフォーム別にバインドする項目
    if (Platform.isAndroid) {
      _bindForAndroid(container);
    } else if (Platform.isIOS) {
      _bindForIOS(container);
    } else if (kIsWeb) {
      _bindForWeb(container);
    }
  }

  static void _bindShared(InjectionContainer container) {}

  static void _bindForAndroid(InjectionContainer container) {
    // container.bindAsSingleton<ScanApi>(ScanApiImplNative());
    // container.bindAsSingleton<ScanApi>(ScanApiImplEmulated());
    // container.bindAsSingleton<ConnectionApi>(ConnectionApiImplEmulated());
  }

  static void _bindForIOS(InjectionContainer container) {
    // container.bindAsSingleton<ScanApi>(ScanApiImplNative());
    // container.bindAsSingleton<ConnectionApi>(ConnectionApiImplNative());
  }

  static void _bindForWeb(InjectionContainer container) {
    // container.bindAsSingleton<ScanApi>(ScanApiImplEmulated());
  }
}
