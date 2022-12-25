import 'package:crypto/crypto.dart';
import 'dart:convert';

// 对原始数据做 sha256
String dataToHash(String data) {
  var bytes = utf8.encode(data); // data being hashed

  var digest = sha256.convert(bytes);
  return digest.toString();
}

// 原始数据转化为 hash bigint
BigInt dataToHashInt(String data) {
  var dataHashString = dataToHash(data);
  return BigInt.parse("0x$dataHashString");
}
