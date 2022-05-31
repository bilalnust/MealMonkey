import 'dart:convert';

class OrderModel {
  String orderId;
  String uid;
  String foodId;
  num orderAmount;
  DateTime orderDateTime;
  int orderCount;
  num discount;
  num orderTotal;
  OrderModel({
   this.orderId,
   this.uid,
   this.foodId,
   this.orderAmount,
   this.orderDateTime,
   this.orderCount,
   this.discount,
   this.orderTotal,
  });

  OrderModel copyWith({
    String orderId,
    String uid,
    String foodId,
    num orderAmount,
    DateTime orderDateTime,
    int orderCount,
    num discount,
    num orderTotal,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      uid: uid ?? this.uid,
      foodId: foodId ?? this.foodId,
      orderAmount: orderAmount ?? this.orderAmount,
      orderDateTime: orderDateTime ?? this.orderDateTime,
      orderCount: orderCount ?? this.orderCount,
      discount: discount ?? this.discount,
      orderTotal: orderTotal ?? this.orderTotal,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'orderId': orderId});
    result.addAll({'uid': uid});
    result.addAll({'foodId': foodId});
    result.addAll({'orderAmount': orderAmount});
    result.addAll({'orderDateTime': orderDateTime.millisecondsSinceEpoch});
    result.addAll({'orderCount': orderCount});
    result.addAll({'discount': discount});
    result.addAll({'orderTotal': orderTotal});
  
    return result;
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] ?? '',
      uid: map['uid'] ?? '',
      foodId: map['foodId'] ?? '',
      orderAmount: map['orderAmount'] ?? 0,
      orderDateTime: DateTime.fromMillisecondsSinceEpoch(map['orderDateTime']),
      orderCount: map['orderCount']?.toInt() ?? 0,
      discount: map['discount'] ?? 0,
      orderTotal: map['orderTotal'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, uid: $uid, foodId: $foodId, orderAmount: $orderAmount, orderDateTime: $orderDateTime, orderCount: $orderCount, discount: $discount, orderTotal: $orderTotal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModel &&
      other.orderId == orderId &&
      other.uid == uid &&
      other.foodId == foodId &&
      other.orderAmount == orderAmount &&
      other.orderDateTime == orderDateTime &&
      other.orderCount == orderCount &&
      other.discount == discount &&
      other.orderTotal == orderTotal;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
      uid.hashCode ^
      foodId.hashCode ^
      orderAmount.hashCode ^
      orderDateTime.hashCode ^
      orderCount.hashCode ^
      discount.hashCode ^
      orderTotal.hashCode;
  }
}
