import 'package:blind_sign/blind.dart';
import 'package:blind_sign/hash_man.dart';
import 'package:blind_sign/key_parser.dart';
import 'package:blind_sign/sign.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/pointycastle.dart';

void main() async {
  final publicKey = await loadKey<RSAPublicKey>('test/public.pem');
  final privateKey = await loadKey<RSAPrivateKey>('test/private.pem');

  final plainText = 'hello';
  var blinder = Blind(publicKey);
  blinder.blindData(plainText);
  // print(blinder.blinded);
  var blindSigned = sign(blinder.blinded, privateKey);
  // print(blindSigned);
  print(sign(dataToHashInt(plainText), privateKey) ==
      blinder.unblindData(blindSigned));
  print(blinder
          .unblindData(blindSigned)
          .modPow(publicKey.publicExponent!, publicKey.n!) ==
      dataToHashInt(plainText));
}
