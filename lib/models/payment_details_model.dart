import 'dart:convert';

class PaymentDetailsModel {
  String paymentMethod;
  String methodId;
  String name;
  String uid;
  String code;
  String encryptionId;
  PaymentDetailsModel({
    this.paymentMethod,
    this.methodId,
    this.name,
    this.uid,
    this.code,
    this.encryptionId,
  });

  PaymentDetailsModel copyWith({
    paymentMethod,
    methodId,
    name,
    uid,
    code,
    encryptionId,
  }) {
    return PaymentDetailsModel(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      methodId: methodId ?? this.methodId,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      code: code ?? this.code,
      encryptionId: encryptionId ?? this.encryptionId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'paymentMethod': paymentMethod});
    result.addAll({'methodId': methodId});
    result.addAll({'name': name});
    result.addAll({'uid': uid});
    result.addAll({'code': code});
    result.addAll({'encryptionId': encryptionId});

    return result;
  }

  factory PaymentDetailsModel.fromMap(Map<String, dynamic> map) {
    return PaymentDetailsModel(
      paymentMethod: map['paymentMethod'] ?? '',
      methodId: map['methodId'] ?? '',
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      code: map['code'] ?? '',
      encryptionId: map['encryptionId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentDetailsModel.fromJson(String source) =>
      PaymentDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentDetailsModel(paymentMethod: $paymentMethod, methodId: $methodId, name: $name, uid: $uid, code: $code, encryptionId: $encryptionId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentDetailsModel &&
        other.paymentMethod == paymentMethod &&
        other.methodId == methodId &&
        other.name == name &&
        other.uid == uid &&
        other.code == code &&
        other.encryptionId == encryptionId;
  }

  @override
  int get hashCode {
    return paymentMethod.hashCode ^
        methodId.hashCode ^
        name.hashCode ^
        uid.hashCode ^
        code.hashCode ^
        encryptionId.hashCode;
  }
}
