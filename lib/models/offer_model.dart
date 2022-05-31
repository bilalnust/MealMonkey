import 'dart:convert';

class OfferModel {
  int offerCount;
  String restaurantId;
  String offerName;
  String offerTag;
  num offerAmount;
  DateTime offerValidTill;
  OfferModel({
    this.offerCount,
    this.restaurantId,
    this.offerName,
    this.offerTag,
    this.offerAmount,
    this.offerValidTill,
  });

  OfferModel copyWith({
    int offerCount,
    String restaurantId,
    String offerName,
    String offerTag,
    num offerAmount,
    DateTime offerValidTill,
  }) {
    return OfferModel(
      offerCount: offerCount ?? this.offerCount,
      restaurantId: restaurantId ?? this.restaurantId,
      offerName: offerName ?? this.offerName,
      offerTag: offerTag ?? this.offerTag,
      offerAmount: offerAmount ?? this.offerAmount,
      offerValidTill: offerValidTill ?? this.offerValidTill,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'offerCount': offerCount});
    result.addAll({'restaurantId': restaurantId});
    result.addAll({'offerName': offerName});
    result.addAll({'offerTag': offerTag});
    result.addAll({'offerAmount': offerAmount});
    result.addAll({'offerValidTill': offerValidTill.millisecondsSinceEpoch});
  
    return result;
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      offerCount: map['offerCount']?.toInt() ?? 0,
      restaurantId: map['restaurantId'] ?? '',
      offerName: map['offerName'] ?? '',
      offerTag: map['offerTag'] ?? '',
      offerAmount: map['offerAmount'] ?? 0,
      offerValidTill: DateTime.fromMillisecondsSinceEpoch(map['offerValidTill']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) => OfferModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfferModel(offerCount: $offerCount, restaurantId: $restaurantId, offerName: $offerName, offerTag: $offerTag, offerAmount: $offerAmount, offerValidTill: $offerValidTill)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OfferModel &&
      other.offerCount == offerCount &&
      other.restaurantId == restaurantId &&
      other.offerName == offerName &&
      other.offerTag == offerTag &&
      other.offerAmount == offerAmount &&
      other.offerValidTill == offerValidTill;
  }

  @override
  int get hashCode {
    return offerCount.hashCode ^
      restaurantId.hashCode ^
      offerName.hashCode ^
      offerTag.hashCode ^
      offerAmount.hashCode ^
      offerValidTill.hashCode;
  }
}
