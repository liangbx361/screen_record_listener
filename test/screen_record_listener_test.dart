import 'package:flutter_test/flutter_test.dart';
import 'package:screen_record_listener/screen_record_listener.dart';
import 'package:screen_record_listener/screen_record_listener_platform_interface.dart';
import 'package:screen_record_listener/screen_record_listener_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenRecordListenerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenRecordListenerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenRecordListenerPlatform initialPlatform = ScreenRecordListenerPlatform.instance;

  test('$MethodChannelScreenRecordListener is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenRecordListener>());
  });

  test('getPlatformVersion', () async {
    ScreenRecordListener screenRecordListenerPlugin = ScreenRecordListener();
    MockScreenRecordListenerPlatform fakePlatform = MockScreenRecordListenerPlatform();
    ScreenRecordListenerPlatform.instance = fakePlatform;

    expect(await screenRecordListenerPlugin.getPlatformVersion(), '42');
  });
}
