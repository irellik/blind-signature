import 'package:blind_sign/hash_man.dart';
import 'package:blind_sign/verify.dart';
import 'package:test/test.dart';

void main() {
  test('dataToHash', () {
    expect(dataToHash("hello dart"),
        "ac5f0a9786d94d4e054dae6d2f8f952d91372d8ccd4402ea210b9197fcca4bb8");
  });

  test('verify', () async {
    verify("hello Dart").then((value) => {expect(value, true)});
  });
}
