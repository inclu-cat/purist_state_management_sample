import 'package:flutter/material.dart';
import 'package:purist_state_management_sample/pages/sample_page.dart';
import 'package:purist_state_management_sample/services/sample_service.dart';

void main() {

  // if you want to use mock object. do this.
  // SampleService.useMock = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SamplePage(),
    );
  }
}
