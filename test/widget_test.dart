// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:purist_state_management_sample/main.dart';
import 'package:purist_state_management_sample/services/sample_service.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    SampleService.mock = _SampleServiceMock();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // tap the "retrieve text data" button.
    final button = find.text('retrieve text data');
    await tester.tap(button);
    await tester.pumpAndSettle();

    // Verify that data view shows "mock data".
    expect(find.text('mock data'), findsOneWidget);
  });
}


class _SampleServiceMock extends SampleService{
  @override
  Future<Color> getButtonColor() async {
    return Colors.amber;
  }

  @override
  Future<String> getTextData() async {
    return 'mock data';
  }

}