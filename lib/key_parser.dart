import 'package:pointycastle/asymmetric/api.dart';
import 'package:encrypt/encrypt_io.dart';

/// 加载密钥
Future<T> loadKey<T extends RSAAsymmetricKey>(String filename) {
  return parseKeyFromFile<T>(filename);
}
