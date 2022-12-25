# 点子投票盲签名算法实现 - Dart

## 流程简述
这里仅描述盲化和签名过程，不包含身份校验、计票

1. 投票者对信息 message 使用 sha256 得到哈希值 m（实际可以加 salt）
2. 根据公钥计算盲化因子 r，对 m 做盲化处理 得到 m'
3. 将盲化后的数据 m' 发送给身份校验者，身份校验者使用私钥对其进行签名，得到盲化后的签名 s'
4. 投票者使用盲化因子将盲化后的签名 s' 进行去盲，得到盲化前的数据签名 s

## 测试
```dart
dart test
```

## 参考
- https://github.com/kevinejohn/blind-signatures
- https://learnblockchain.cn/article/2527
- https://www.jianshu.com/p/0d4943a0f34d