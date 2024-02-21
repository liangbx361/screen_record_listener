import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_record_listener_method_channel.dart';

abstract class ScreenRecordListenerPlatform extends PlatformInterface {
  /// Constructs a ScreenRecordListenerPlatform.
  ScreenRecordListenerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenRecordListenerPlatform _instance = MethodChannelScreenRecordListener();

  /// The default instance of [ScreenRecordListenerPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenRecordListener].
  static ScreenRecordListenerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenRecordListenerPlatform] when
  /// they register themselves.
  static set instance(ScreenRecordListenerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
