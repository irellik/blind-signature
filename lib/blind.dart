import 'package:blind_sign/hash_man.dart';
import 'package:blind_sign/random_bigint.dart';
import 'package:pointycastle/pointycastle.dart';

class Blind {
  late RSAPublicKey publicKey;
  late BigInt N, E;
  BigInt blinded = BigInt.from(0);
  BigInt r = BigInt.from(0);
  BigInt _gcd = BigInt.from(0);

  Blind(RSAPublicKey publicKey) {
    publicKey = publicKey;
    if (publicKey.n == null || publicKey.publicExponent == null) {
      throw FormatException('Invalid public key');
    }
    N = publicKey.n!;
    E = publicKey.publicExponent!;
  }

  BigInt generateR() {
    // 如果已经生成过，则直接返回
    if (r != BigInt.from(0)) {
      return r;
    }
    var bigOne = BigInt.from(1);
    do {
      r = randomBigInt(64) % N;
      _gcd = r.gcd(N);
    } while (
        !(_gcd == bigOne) || r.compareTo(N) >= 0 || r.compareTo(bigOne) <= 0);
    return r;
  }

  BigInt blindData(String data) {
    var dataHashInt = dataToHashInt(data);
    r = generateR();
    blinded = (dataHashInt * r.modPow(E, N)) % N;
    return blinded;
  }

  BigInt unblindData(BigInt signed) {
    return (signed * r.modInverse(N)) % N;
  }
}
