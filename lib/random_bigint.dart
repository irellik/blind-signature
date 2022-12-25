import 'dart:math';

// 随机大数
BigInt randomBigInt(int length) {
  Random random = Random();
  var randomString = "";
  for (var i = 0; i < length; i++) {
    randomString += random.nextInt(10).toString();
  }
  return BigInt.parse(randomString);
}
