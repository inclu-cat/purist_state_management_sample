
import 'dart:math';

import 'package:flutter/material.dart';

abstract class SampleService {
  // switch for using mock
  static SampleService? mock;

  // singleton logic
  static SampleService? _instance;
  static SampleService instance() {
    _instance ??= mock != null ? mock : _SampleServiceImpl();
    return _instance!;
  }

  // interfaces
  Future<String> getTextData();
  Future<Color> getButtonColor();
}

class _SampleServiceImpl extends SampleService{
  int colorIndex = 0;
  int textDataIndex = 0;

  @override
  Future<Color> getButtonColor() async {
    var data = [
      Colors.amber,
      Colors.green,
      Colors.pink,
      Colors.blue,
    ];
    colorIndex++;
    if ( colorIndex >= data.length ){
      colorIndex = 0;
    }
    return data[colorIndex];
  }

  @override
  Future<String> getTextData() async {
    var data = [
      'XjfGrkLFVPuNFmUDYbXghWmdVYpWKrLUcH',
      'WVRWNVePfuFPchRYkPPXTxGWhhjEEjtdFp',
      'WTnryAEaNBXFecgVmtrBfzHQCsXnsJSnhY',
      'WstYRrtdhucnBawMVbzVAUQckMpUVARUuC',
    ];
    textDataIndex++;
    if ( textDataIndex >= data.length ){
      textDataIndex = 0;
    }
    return data[textDataIndex];
  }

}
