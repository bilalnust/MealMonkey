import 'dart:convert';

import 'package:flutter/foundation.dart';

class MenuModel {
  List menuList;
  String menuName;
  int menuItemCount;
  DateTime menuDate;
  MenuModel({
    this.menuList,
    this.menuName,
    this.menuItemCount,
    this.menuDate,
  });

  MenuModel copyWith({
    List menuList,
    String menuName,
    int menuItemCount,
    DateTime menuDate,
  }) {
    return MenuModel(
      menuList: menuList ?? this.menuList,
      menuName: menuName ?? this.menuName,
      menuItemCount: menuItemCount ?? this.menuItemCount,
      menuDate: menuDate ?? this.menuDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'menuList': menuList});
    result.addAll({'menuName': menuName});
    result.addAll({'menuItemCount': menuItemCount});
    result.addAll({'menuDate': menuDate.millisecondsSinceEpoch});
  
    return result;
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      menuList: List.from(map['menuList']),
      menuName: map['menuName'] ?? '',
      menuItemCount: map['menuItemCount']?.toInt() ?? 0,
      menuDate: DateTime.fromMillisecondsSinceEpoch(map['menuDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(menuList: $menuList, menuName: $menuName, menuItemCount: $menuItemCount, menuDate: $menuDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MenuModel &&
      listEquals(other.menuList, menuList) &&
      other.menuName == menuName &&
      other.menuItemCount == menuItemCount &&
      other.menuDate == menuDate;
  }

  @override
  int get hashCode {
    return menuList.hashCode ^
      menuName.hashCode ^
      menuItemCount.hashCode ^
      menuDate.hashCode;
  }
}
