typedef Resolver<T> = T Function();

/// DIコンテナ
class InjectionContainer {
  //  type -> インスタンス解決方法
  static final Map<Type, Resolver<Object>> _map = {};

  //  singleton実装
  static final InjectionContainer _instance = InjectionContainer._();
  factory InjectionContainer() {
    return _instance;
  }
  InjectionContainer._();

  /// インスタンス解決方法の指定
  bind<T extends Object>(Resolver<T> creator) {
    _map[T] = creator;
  }

  /// インスタンスをsingletonインスタンスとして登録する
  bindAsSingleton<T extends Object>(T instance) {
    _map[T] = (() => instance);
  }

  /// インスタンスを取得する
  T inject<T extends Object>() {
    if (_map.containsKey(T)) {
      final Object resolved = _map[T]!.call();
      return resolved as T;
    } else {
      throw Exception("DI type key is not registered.");
    }
  }
}
