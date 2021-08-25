import 'package:flutter/material.dart';
import 'package:purist_state_management_sample/services/sample_service.dart';

class SampleModel {
  final textData = ValueNotifier<String>('');
  final buttonColor = ValueNotifier<Color>(Colors.black);

  void retrieveTextData() async {
    textData.value = await SampleService.instance().getTextData();
  }

  void retrieveButtonColor() async {
    buttonColor.value = await SampleService.instance().getButtonColor();
  }

  void dispose() {
    textData.dispose();
    buttonColor.dispose();
  }
}
