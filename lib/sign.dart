import 'package:pointycastle/pointycastle.dart';

// 签名
BigInt sign(BigInt data, RSAPrivateKey privateKey) {
  if (privateKey.n == null || privateKey.privateExponent == null) {
    throw FormatException('Invalid public key');
  }
  return data.modPow(privateKey.privateExponent!, privateKey.n!);
}
