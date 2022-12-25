import 'package:blind_sign/blind.dart';
import 'package:blind_sign/hash_man.dart';
import 'package:blind_sign/key_parser.dart';
import 'package:blind_sign/sign.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/pointycastle.dart';

Future<bool> verify(String data) async {
  // 加载密钥
  final publicKey = await loadKey<RSAPublicKey>('test/public.pem');
  final privateKey = await loadKey<RSAPrivateKey>('test/private.pem');

  // 使用公钥初始化盲化器
  var blinder = Blind(publicKey);
  // 使用私钥对盲化后的数据做签名
  var blindSigned = sign(blinder.blindData(data), privateKey);
  // 验证去盲后的签名是否和原始数据匹配
  return blinder
          .unblindData(blindSigned)
          .modPow(publicKey.publicExponent!, publicKey.n!) ==
      dataToHashInt(data);
}
