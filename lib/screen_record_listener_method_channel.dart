import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_record_listener_platform_interface.dart';

/// An implementation of [ScreenRecordListenerPlatform] that uses method channels.
class MethodChannelScreenRecordListener extends ScreenRecordListenerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_record_listener');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
