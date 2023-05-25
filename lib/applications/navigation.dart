import 'package:flutter/material.dart';

import 'package:template/view/main_page/main_page.dart';

enum NavigationScreens {
  launcher,
}

extension NavigationScreensExtension on NavigationScreens {
  static final _routeNames = {
    NavigationScreens.launcher: '/',
  };

  String get routeName => _routeNames[this]!;
}

class ApplicationNavigator {
  /// 画面スタックにpushする
  static void push(BuildContext context, NavigationScreens to,
      {Object? arguments}) {
    Navigator.pushNamed(context, to.routeName, arguments: arguments);
  }

  /// 画面スタックにpushする
  static Future pushAndWaitForResult(BuildContext context, NavigationScreens to,
      {Object? arguments}) async {
    return await Navigator.pushNamed(context, to.routeName,
        arguments: arguments);
  }

  /// 画面スタックを全popしてpush
  /// 途中に対象が存在するならそこまで
  static void pushAndRemoveUntil(BuildContext context, NavigationScreens to,
      {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, to.routeName, (_) => false,
        arguments: arguments);
  }

  /// 画面スタックのpeekを入れ替える
  static void replacePeek(BuildContext context, NavigationScreens to,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(context, to.routeName);
  }

  /// 画面スタックからpeekを取り除く(ひとつ戻る)
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  /// 画面スタックからpeekを取り除く(ひとつ戻る)
  static void popWithResult<T>(BuildContext context, T result) {
    Navigator.pop(context, result);
  }

  /// ルーティング定義
  static final Map<String, WidgetBuilder> routes = {
    NavigationScreens.launcher.routeName: (BuildContext context) =>
        const MainPage(),
  };
}
