import 'dart:convert';

import 'package:flutter/foundation.dart';

class RestaurantModel {
  String restaurantName;
  String restaurantId;
  String restaurantStar;
  String restaurantMenuItem;
  List<String> restaurantImageURL;
  RestaurantModel({
    this.restaurantName,
    this.restaurantId,
    this.restaurantStar,
    this.restaurantMenuItem,
    this.restaurantImageURL,
  });
  

  RestaurantModel copyWith({
    String restaurantName,
    String restaurantId,
    String restaurantStar,
    String restaurantMenuItem,
    List<String> restaurantImageURL,
  }) {
    return RestaurantModel(
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantStar: restaurantStar ?? this.restaurantStar,
      restaurantMenuItem: restaurantMenuItem ?? this.restaurantMenuItem,
      restaurantImageURL: restaurantImageURL ?? this.restaurantImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'restaurantName': restaurantName});
    result.addAll({'restaurantId': restaurantId});
    result.addAll({'restaurantStar': restaurantStar});
    result.addAll({'restaurantMenuItem': restaurantMenuItem});
    result.addAll({'restaurantImageURL': restaurantImageURL});
  
    return result;
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      restaurantName: map['restaurantName'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      restaurantStar: map['restaurantStar'] ?? '',
      restaurantMenuItem: map['restaurantMenuItem'] ?? '',
      restaurantImageURL: List<String>.from(map['restaurantImageURL']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) => RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantModel(restaurantName: $restaurantName, restaurantId: $restaurantId, restaurantStar: $restaurantStar, restaurantMenuItem: $restaurantMenuItem, restaurantImageURL: $restaurantImageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RestaurantModel &&
      other.restaurantName == restaurantName &&
      other.restaurantId == restaurantId &&
      other.restaurantStar == restaurantStar &&
      other.restaurantMenuItem == restaurantMenuItem &&
      listEquals(other.restaurantImageURL, restaurantImageURL);
  }

  @override
  int get hashCode {
    return restaurantName.hashCode ^
      restaurantId.hashCode ^
      restaurantStar.hashCode ^
      restaurantMenuItem.hashCode ^
      restaurantImageURL.hashCode;
  }
}
